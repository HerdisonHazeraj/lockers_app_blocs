part of 'update_student_bloc.dart';

sealed class UpdateStudentState extends Equatable {
  const UpdateStudentState();

  @override
  List<Object> get props => [];
}

final class UpdateStudentInitial extends UpdateStudentState {}

final class UpdateStudentFailure extends UpdateStudentState {
  final String message;

  const UpdateStudentFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class UpdateStudentLoading extends UpdateStudentState {}

final class UpdateStudentSuccess extends UpdateStudentState {
  const UpdateStudentSuccess(this.student);

  final Student student;
}
