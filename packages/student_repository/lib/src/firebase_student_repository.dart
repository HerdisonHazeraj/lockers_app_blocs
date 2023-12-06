import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_repository/student_repository.dart';
import 'dart:developer' as dev;

import 'package:uuid/uuid.dart';

class FirebaseStudentRepository implements StudentRepository {
  final studentsCollection = FirebaseFirestore.instance.collection("students");

  @override
  Future<Student> createStudent(Student student) async {
    try {
      student.id = const Uuid().v1();
      await studentsCollection
          .doc(student.id)
          .set(student.toEntity().toDocument());

      return student;
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Student> deleteStudent(Student student) async {
    try {
      await studentsCollection.doc(student.id).delete();
      return student;
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Student> updateStudent(Student student) async {
    try {
      await studentsCollection
          .doc(student.id)
          .update(student.toEntity().toDocument());
      return student;
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Student>> getStudents() async {
    try {
      return studentsCollection.get().then((value) => value.docs
          .map(
            (e) => Student.fromEntity(StudentEntity.fromDocument(e.data())),
          )
          .toList());
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }
}
