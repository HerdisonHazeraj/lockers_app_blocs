import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locker_repository/user_repository.dart';

part 'get_lockers_event.dart';
part 'get_lockers_state.dart';

class GetLockersBloc extends Bloc<GetLockersEvent, GetLockersState> {
  final LockerRepository lockerRepository;
  GetLockersBloc({required LockerRepository myLockerRepository})
      : lockerRepository = myLockerRepository,
        super(GetLockersInitial()) {
    on<GetLockers>((event, emit) async {
      emit(GetLockersLoading());
      try {
        List<Locker> lockers = await lockerRepository.getLockers();
        emit(GetLockersSuccess(lockers));
      } catch (e) {
        emit(GetLockersFailure(e.toString()));
      }
    });
  }
}
