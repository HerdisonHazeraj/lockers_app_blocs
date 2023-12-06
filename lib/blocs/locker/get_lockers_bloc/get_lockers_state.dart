part of 'get_lockers_bloc.dart';

sealed class GetLockersState extends Equatable {
  const GetLockersState();

  @override
  List<Object> get props => [];
}

final class GetLockersInitial extends GetLockersState {}

final class GetLockersFailure extends GetLockersState {}

final class GetLockersLoading extends GetLockersState {}

final class GetLockersSuccess extends GetLockersState {
  const GetLockersSuccess(this.lockers);

  final List<Locker> lockers;
}
