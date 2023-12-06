import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker_repository/user_repository.dart';
import 'package:lockers_app_blocs/app_view.dart';
import 'package:lockers_app_blocs/blocs/locker/get_lockers_bloc/get_lockers_bloc.dart';
import 'package:lockers_app_blocs/blocs/user/authentication_bloc/authentication_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MainApp extends StatelessWidget {
  final UserRepository userRepository;
  final LockerRepository lockerRepository;
  const MainApp(
    this.userRepository,
    this.lockerRepository, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(
            myUserRepository: userRepository,
          ),
        ),
        RepositoryProvider(
          create: (_) => GetLockersBloc(
            myLockerRepository: lockerRepository,
          ),
        ),
      ],
      child: const AppView(),
    );
  }
}
