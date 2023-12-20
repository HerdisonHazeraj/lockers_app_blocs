import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_historics_event.dart';
part 'get_historics_state.dart';

class GetHistoricsBloc extends Bloc<GetHistoricsEvent, GetHistoricsState> {
  GetHistoricsBloc() : super(GetHistoricsInitial()) {
    on<GetHistoricsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
