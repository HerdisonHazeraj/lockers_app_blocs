part of 'create_locker_bloc.dart';

sealed class CreateLockerEvent extends Equatable {
  const CreateLockerEvent();

  @override
  List<Object> get props => [];
}

class CreateLocker extends CreateLockerEvent {
  const CreateLocker(this.locker);
  final Locker locker;
}
