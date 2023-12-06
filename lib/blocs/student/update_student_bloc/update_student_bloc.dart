import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_repository/student_repository.dart';

part 'update_student_event.dart';
part 'update_student_state.dart';

class UpdateStudentBloc extends Bloc<UpdateStudentEvent, UpdateStudentState> {
  final StudentRepository _studentRepository;
  UpdateStudentBloc({required StudentRepository studentRepository})
      : _studentRepository = studentRepository,
        super(UpdateStudentInitial()) {
    on<UpdateStudent>((event, emit) async {
      emit(UpdateStudentLoading());
      try {
        Student student = await _studentRepository.updateStudent(event.student);
        emit(UpdateStudentSuccess(student));
      } catch (e) {
        emit(UpdateStudentFailure(e.toString()));
      }
    });
  }
}
