part of 'delete_student_bloc.dart';

sealed class DeleteStudentEvent extends Equatable {
  const DeleteStudentEvent();

  @override
  List<Object> get props => [];
}

class DeleteStudent extends DeleteStudentEvent {
  const DeleteStudent(this.student);

  final Student student;
}
