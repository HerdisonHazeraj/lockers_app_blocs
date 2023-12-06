part of 'update_locker_bloc.dart';

sealed class UpdateLockerEvent extends Equatable {
  const UpdateLockerEvent();

  @override
  List<Object> get props => [];
}

class UpdateLocker extends UpdateLockerEvent {
  const UpdateLocker(this.locker);
  final Locker locker;
}
