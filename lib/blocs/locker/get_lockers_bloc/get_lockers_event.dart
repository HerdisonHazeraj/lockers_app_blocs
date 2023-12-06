part of 'get_lockers_bloc.dart';

sealed class GetLockersEvent extends Equatable {
  const GetLockersEvent();

  @override
  List<Object> get props => [];
}

class GetLockers extends GetLockersEvent {}
