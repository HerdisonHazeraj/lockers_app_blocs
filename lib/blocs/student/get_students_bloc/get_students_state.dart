part of 'get_students_bloc.dart';

sealed class GetStudentsState extends Equatable {
  const GetStudentsState();

  @override
  List<Object> get props => [];
}

final class GetStudentsInitial extends GetStudentsState {}

final class GetStudentsLoading extends GetStudentsState {}

final class GetStudentsFailure extends GetStudentsState {
  final String message;

  const GetStudentsFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class GetStudentsSuccess extends GetStudentsState {
  const GetStudentsSuccess(this.students);

  final List<Student> students;
}
