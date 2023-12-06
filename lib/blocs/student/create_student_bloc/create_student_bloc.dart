import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_repository/student_repository.dart';

part 'create_student_event.dart';
part 'create_student_state.dart';

class CreateStudentBloc extends Bloc<CreateStudentEvent, CreateStudentState> {
  final StudentRepository _studentRepository;
  CreateStudentBloc({required StudentRepository studentRepository})
      : _studentRepository = studentRepository,
        super(CreateStudentInitial()) {
    on<CreateStudent>((event, emit) async {
      emit(CreateStudentLoading());
      try {
        Student student = await _studentRepository.createStudent(event.student);
        emit(CreateStudentSuccess(student));
      } catch (e) {
        emit(CreateStudentFailure(e.toString()));
      }
    });
  }
}
