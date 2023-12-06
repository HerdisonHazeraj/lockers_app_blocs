import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locker_repository/user_repository.dart';

part 'create_locker_event.dart';
part 'create_locker_state.dart';

class CreateLockerBloc extends Bloc<CreateLockerEvent, CreateLockerState> {
  final LockerRepository _lockerRepository;
  CreateLockerBloc({required LockerRepository lockerRepository})
      : _lockerRepository = lockerRepository,
        super(CreateLockerInitial()) {
    on<CreateLocker>((event, emit) async {
      emit(CreateLockerLoading());
      try {
        Locker locker = await _lockerRepository.createLocker(event.locker);
        emit(CreateLockerSuccess(locker));
      } catch (e) {
        emit(CreateLockerFailure(e.toString()));
      }
    });
  }
}
