import 'package:student_repository/src/models/models.dart';

abstract class StudentRepository {
  Future<Student> createStudent(Student student);
  Future<Student> deleteStudent(Student student);
  Future<Student> updateStudent(Student student);

  Future<List<Student>> getStudents();
}
