part of 'delete_locker_bloc.dart';

sealed class DeleteLockerEvent extends Equatable {
  const DeleteLockerEvent();

  @override
  List<Object> get props => [];
}

class DeleteLocker extends DeleteLockerEvent {
  const DeleteLocker(this.locker);

  final Locker locker;
}
