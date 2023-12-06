part of 'create_locker_bloc.dart';

sealed class CreateLockerState extends Equatable {
  const CreateLockerState();

  @override
  List<Object> get props => [];
}

final class CreateLockerInitial extends CreateLockerState {}

final class CreateLockerFailure extends CreateLockerState {
  final String message;

  const CreateLockerFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class CreateLockerSuccess extends CreateLockerState {
  final Locker locker;

  const CreateLockerSuccess(this.locker);
}

final class CreateLockerLoading extends CreateLockerState {}
