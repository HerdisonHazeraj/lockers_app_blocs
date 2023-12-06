import 'dart:developer' as dev;
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  //Chaque fois qu'un bloc est créé
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    dev.log('onCreate -- bloc ${bloc.runtimeType}');
  }

  //Chaque fois qu'un événement est créé
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    dev.log('onEvent -- bloc ${bloc.runtimeType}, event: $event');
  }

  //Chaque fois qu'un state change
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    dev.log('onChange -- bloc ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    dev.log('onTransition -- bloc ${bloc.runtimeType}, transition: transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    dev.log('onError -- bloc ${bloc.runtimeType}, error: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    dev.log('onClose -- bloc ${bloc.runtimeType}');
  }
}
