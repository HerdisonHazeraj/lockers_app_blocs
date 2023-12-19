import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_repository/student_repository.dart';

part 'delete_student_event.dart';
part 'delete_student_state.dart';

class DeleteStudentBloc extends Bloc<DeleteStudentEvent, DeleteStudentState> {
  final StudentRepository _studentRepository;
  DeleteStudentBloc({required StudentRepository studentRepository})
      : _studentRepository = studentRepository,
        super(DeleteStudentInitial()) {
    on<DeleteStudent>((event, emit) async {
      emit(DeleteStudentLoading());
      try {
        Student student = await _studentRepository.deleteStudent(event.student);
        emit(DeleteStudentSuccess(student));
      } catch (e) {
        emit(DeleteStudentFailure(e.toString()));
      }
    });
  }
}
