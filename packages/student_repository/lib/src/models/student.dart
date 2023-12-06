import 'package:equatable/equatable.dart';
import 'package:student_repository/src/models/istudent.dart';
import 'package:student_repository/student_repository.dart';

class Student extends IStudent with EquatableMixin {
  String? id;
  String firstName;
  String lastName;
  String job;
  String responsable;
  int caution;
  int lockerNumber;
  String login;
  String classe;
  int year;
  bool? isArchived;
  bool? isTerminal;

  Student({
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

  static final empty = Student(
    id: '',
    firstName: '',
    lastName: '',
    job: '',
    responsable: '',
    caution: 0,
    lockerNumber: 0,
    login: '',
    classe: '',
    year: 0,
    isArchived: false,
    isTerminal: false,
  );

  Student copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? job,
    String? responsable,
    int? caution,
    int? lockerNumber,
    String? login,
    String? classe,
    int? year,
    bool? isArchived,
    bool? isTerminal,
  }) {
    return Student(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      job: job ?? this.job,
      responsable: responsable ?? this.responsable,
      caution: caution ?? this.caution,
      lockerNumber: lockerNumber ?? this.lockerNumber,
      login: login ?? this.login,
      classe: classe ?? this.classe,
      year: year ?? this.year,
      isArchived: isArchived ?? this.isArchived,
      isTerminal: isTerminal ?? this.isTerminal,
    );
  }

  StudentEntity toEntity() {
    return StudentEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      job: job,
      responsable: responsable,
      caution: caution,
      lockerNumber: lockerNumber,
      login: login,
      classe: classe,
      year: year,
      isArchived: isArchived,
      isTerminal: isTerminal,
    );
  }

  static Student fromEntity(StudentEntity entity) {
    return Student(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      job: entity.job,
      responsable: entity.responsable,
      caution: entity.caution,
      lockerNumber: entity.lockerNumber,
      login: entity.login,
      classe: entity.classe,
      year: entity.year,
      isArchived: entity.isArchived,
      isTerminal: entity.isTerminal,
    );
  }

  bool get isEmpty => this == Student.empty;
  bool get isNotEmpty => this != Student.empty;

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
