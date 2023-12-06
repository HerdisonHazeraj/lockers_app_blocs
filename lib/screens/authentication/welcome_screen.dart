import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockers_app_blocs/blocs/user/authentication_bloc/authentication_bloc.dart';
import 'package:lockers_app_blocs/blocs/user/sign_in_bloc/sign_in_bloc.dart';
import 'package:lockers_app_blocs/blocs/user/sign_up_bloc/sign_up_bloc.dart';
import 'package:lockers_app_blocs/screens/authentication/sign_in_screen.dart';
import 'package:lockers_app_blocs/screens/authentication/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 30,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                unselectedLabelColor:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                labelColor: Theme.of(context).colorScheme.onBackground,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Connexion',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Inscription',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    BlocProvider(
                      create: (context) => SignInBloc(
                          userRepository: context
                              .read<AuthenticationBloc>()
                              .userRepository),
                      child: const SignInScreen(),
                    ),
                    BlocProvider(
                      create: (context) => SignUpBloc(
                          userRepository: context
                              .read<AuthenticationBloc>()
                              .userRepository),
                      child: const SignUpScreen(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
