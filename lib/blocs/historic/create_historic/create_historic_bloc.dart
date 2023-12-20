import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_historic_event.dart';
part 'create_historic_state.dart';

class CreateHistoricBloc extends Bloc<CreateHistoricEvent, CreateHistoricState> {
  CreateHistoricBloc() : super(CreateHistoricInitial()) {
    on<CreateHistoricEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
