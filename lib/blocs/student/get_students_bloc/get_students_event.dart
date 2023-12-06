part of 'get_students_bloc.dart';

sealed class GetStudentsEvent extends Equatable {
  const GetStudentsEvent();

  @override
  List<Object> get props => [];
}

class GetStudents extends GetStudentsEvent {}
