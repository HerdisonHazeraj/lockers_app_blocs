import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locker_repository/user_repository.dart';
import 'package:lockers_app_blocs/app.dart';
import 'package:lockers_app_blocs/firebase_options.dart';
import 'package:lockers_app_blocs/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MainApp(
    FirebaseUserRepository(),
    FirebaseLockerRepository(),
  ));
}
