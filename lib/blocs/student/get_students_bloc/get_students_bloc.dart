import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_repository/student_repository.dart';

part 'get_students_event.dart';
part 'get_students_state.dart';

class GetStudentsBloc extends Bloc<GetStudentsEvent, GetStudentsState> {
  final StudentRepository studentRepository;
  GetStudentsBloc({required StudentRepository myStudentRepository})
      : studentRepository = myStudentRepository,
        super(GetStudentsInitial()) {
    on<GetStudents>((event, emit) async {
      emit(GetStudentsLoading());
      try {
        List<Student> students = await studentRepository.getStudents();
        emit(GetStudentsSuccess(students));
      } catch (e) {
        emit(GetStudentsFailure(e.toString()));
      }
    });
  }
}
