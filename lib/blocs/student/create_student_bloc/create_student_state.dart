part of 'create_student_bloc.dart';

sealed class CreateStudentState extends Equatable {
  const CreateStudentState();

  @override
  List<Object> get props => [];
}

final class CreateStudentInitial extends CreateStudentState {}

final class CreateStudentFailure extends CreateStudentState {
  final String message;

  const CreateStudentFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class CreateStudentSuccess extends CreateStudentState {
  final Student student;

  const CreateStudentSuccess(this.student);
}

final class CreateStudentLoading extends CreateStudentState {}
