part of 'create_historic_bloc.dart';

sealed class CreateHistoricState extends Equatable {
  const CreateHistoricState();
  
  @override
  List<Object> get props => [];
}

final class CreateHistoricInitial extends CreateHistoricState {}
