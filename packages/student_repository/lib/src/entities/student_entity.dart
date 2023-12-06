import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final String? id;
  final String firstName;
  final String lastName;
  final String job;
  final String responsable;
  final int caution;
  final int lockerNumber;
  final String login;
  final String classe;
  final int year;
  final bool? isArchived;
  final bool? isTerminal;

  const StudentEntity({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.job,
    required this.responsable,
    required this.caution,
    required this.lockerNumber,
    required this.login,
    required this.classe,
    required this.year,
    this.isArchived = false,
    this.isTerminal = false,
  });

  Map<String, Object?> toDocument() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'job': job,
        'responsable': responsable,
        'caution': caution,
        'lockerNumber': lockerNumber,
        'login': login,
        'classe': classe,
        'year': year,
        'isArchived': isArchived,
        'isTerminal': isTerminal,
      };

  static StudentEntity fromDocument(Map<String, dynamic> doc) {
    return StudentEntity(
      id: doc['id'] as String?,
      firstName: doc['firstName'] as String,
      lastName: doc['lastName'] as String,
      job: doc['job'] as String,
      responsable: doc['responsable'] as String,
      caution: doc['caution'] as int,
      lockerNumber: doc['lockerNumber'] as int,
      login: doc['login'] as String,
      classe: doc['classe'] as String,
      year: doc['year'] as int,
      isArchived: doc['isArchived'] as bool?,
      isTerminal: doc['isTerminal'] as bool?,
    );
  }

  @override
  String toString() {
    return '''StudentEntity: {
      id: $id
      firstName: $firstName
      lastName: $lastName
      job: $job
      responsable: $responsable
      caution: $caution
      lockerNumber: $lockerNumber
      login: $login
      classe: $classe
      year: $year
      isArchived: $isArchived
      isTerminal: $isTerminal
    }''';
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        job,
        responsable,
        caution,
        lockerNumber,
        login,
        classe,
        year,
        isArchived,
        isTerminal,
      ];
}
