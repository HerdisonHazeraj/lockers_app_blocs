import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locker_repository/user_repository.dart';

part 'update_locker_event.dart';
part 'update_locker_state.dart';

class UpdateLockerBloc extends Bloc<UpdateLockerEvent, UpdateLockerState> {
  final LockerRepository _lockerRepository;
  UpdateLockerBloc({required LockerRepository lockerRepository})
      : _lockerRepository = lockerRepository,
        super(UpdateLockerInitial()) {
    on<UpdateLocker>((event, emit) async {
      emit(UpdateLockerLoading());
      try {
        Locker locker = await _lockerRepository.updateLocker(event.locker);
        emit(UpdateLockerSuccess(locker));
      } catch (e) {
        emit(UpdateLockerFailure(e.toString()));
      }
    });
  }
}
