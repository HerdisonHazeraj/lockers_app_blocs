part of 'update_student_bloc.dart';

sealed class UpdateStudentEvent extends Equatable {
  const UpdateStudentEvent();

  @override
  List<Object> get props => [];
}

class UpdateStudent extends UpdateStudentEvent {
  const UpdateStudent(this.student);

  final Student student;
}
