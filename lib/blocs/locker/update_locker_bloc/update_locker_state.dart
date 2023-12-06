part of 'update_locker_bloc.dart';

sealed class UpdateLockerState extends Equatable {
  const UpdateLockerState();

  @override
  List<Object> get props => [];
}

final class UpdateLockerInitial extends UpdateLockerState {}

final class UpdateLockerFailure extends UpdateLockerState {
  final String message;

  const UpdateLockerFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class UpdateLockerLoading extends UpdateLockerState {}

final class UpdateLockerSuccess extends UpdateLockerState {
  const UpdateLockerSuccess(this.locker);

  final Locker locker;
}
