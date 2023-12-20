part of 'get_historics_bloc.dart';

sealed class GetHistoricsState extends Equatable {
  const GetHistoricsState();
  
  @override
  List<Object> get props => [];
}

final class GetHistoricsInitial extends GetHistoricsState {}
