part of 'delete_student_bloc.dart';

sealed class DeleteStudentState extends Equatable {
  const DeleteStudentState();

  @override
  List<Object> get props => [];
}

final class DeleteStudentInitial extends DeleteStudentState {}

final class DeleteStudentLoading extends DeleteStudentState {}

final class DeleteStudentFailure extends DeleteStudentState {
  final String message;

  const DeleteStudentFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class DeleteStudentSuccess extends DeleteStudentState {
  final Student student;

  const DeleteStudentSuccess(this.student);

  @override
  List<Object> get props => [student];
}
