part of 'create_student_bloc.dart';

sealed class CreateStudentEvent extends Equatable {
  const CreateStudentEvent();

  @override
  List<Object> get props => [];
}

class CreateStudent extends CreateStudentEvent {
  const CreateStudent(this.student);

  final Student student;
}
