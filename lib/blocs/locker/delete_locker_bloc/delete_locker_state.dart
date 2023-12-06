part of 'delete_locker_bloc.dart';

sealed class DeleteLockerState extends Equatable {
  const DeleteLockerState();

  @override
  List<Object> get props => [];
}

final class DeleteLockerInitial extends DeleteLockerState {}

final class DeleteLockerLoading extends DeleteLockerState {}

final class DeleteLockerFailure extends DeleteLockerState {
  final String message;

  const DeleteLockerFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class DeleteLockerSuccess extends DeleteLockerState {
  final Locker locker;

  const DeleteLockerSuccess(this.locker);

  @override
  List<Object> get props => [locker];
}
