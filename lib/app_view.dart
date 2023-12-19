import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockers_app_blocs/blocs/locker/get_lockers_bloc/get_lockers_bloc.dart';
import 'package:lockers_app_blocs/blocs/student/get_students_bloc/get_students_bloc.dart';
import 'package:lockers_app_blocs/blocs/user/authentication_bloc/authentication_bloc.dart';
import 'package:lockers_app_blocs/blocs/user/my_user_bloc/my_user_bloc.dart';
import 'package:lockers_app_blocs/blocs/user/sign_in_bloc/sign_in_bloc.dart';
import 'package:lockers_app_blocs/config.dart';
import 'package:lockers_app_blocs/screens/authentication/welcome_screen.dart';
import 'package:lockers_app_blocs/screens/home/home_screen.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application de gestion des casiers du ceff',
      theme: Styles.themeData(isDarkTheme, context),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SignInBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository,
                  ),
                ),
                BlocProvider(
                  create: (context) => MyUserBloc(
                      userRepository:
                          context.read<AuthenticationBloc>().userRepository)
                    ..add(
                      GetMyUser(
                        myUserId:
                            context.read<AuthenticationBloc>().state.user!.uid,
                      ),
                    ),
                ),
                BlocProvider(
                  create: (context) => GetLockersBloc(
                    myLockerRepository:
                        context.read<GetLockersBloc>().lockerRepository,
                  )..add(GetLockers()),
                ),
                BlocProvider(
                  create: (context) => GetStudentsBloc(
                    myStudentRepository:
                        context.read<GetStudentsBloc>().studentRepository,
                  )..add(GetStudents()),
                ),
              ],
              child: const HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
