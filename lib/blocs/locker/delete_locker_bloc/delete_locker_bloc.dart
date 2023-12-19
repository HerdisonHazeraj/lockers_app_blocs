import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locker_repository/locker_repository.dart';

part 'delete_locker_event.dart';
part 'delete_locker_state.dart';

class DeleteLockerBloc extends Bloc<DeleteLockerEvent, DeleteLockerState> {
  final LockerRepository _lockerRepository;
  DeleteLockerBloc({required LockerRepository lockerRepository})
      : _lockerRepository = lockerRepository,
        super(DeleteLockerInitial()) {
    on<DeleteLocker>((event, emit) async {
      emit(DeleteLockerLoading());
      try {
        Locker locker = await _lockerRepository.deleteLocker(event.locker);
        emit(DeleteLockerSuccess(locker));
      } catch (e) {
        emit(DeleteLockerFailure(e.toString()));
      }
    });
  }
}
