import 'package:equatable/equatable.dart';
import 'package:historic_repository/historic_repository.dart';
import 'package:historic_repository/src/models/ihistoric.dart';

class Historic extends IHistoric with EquatableMixin {
  String? id;
  String action;
  String date;
  Map<String, dynamic>? locker;
  Map<String, dynamic>? student;
  final Map<String, dynamic>? oldLocker;
  final Map<String, dynamic>? oldStudent;
  final int? index;

  Historic({
    this.id,
    required this.action,
    required this.date,
    this.locker,
    this.student,
    this.oldLocker,
    this.oldStudent,
    this.index,
  });

  static final empty = Historic(
    id: '',
    action: '',
    date: '',
    locker: {},
    student: {},
    oldLocker: {},
    oldStudent: {},
    index: 0,
  );

  Historic copyWith({
    String? id,
    String? action,
    String? date,
    Map<String, dynamic>? locker,
    Map<String, dynamic>? student,
    Map<String, dynamic>? oldLocker,
    Map<String, dynamic>? oldStudent,
    int? index,
  }) {
    return Historic(
      id: id ?? this.id,
      action: action ?? this.action,
      date: date ?? this.date,
      locker: locker ?? this.locker,
      student: student ?? this.student,
      oldLocker: oldLocker ?? this.oldLocker,
      oldStudent: oldStudent ?? this.oldStudent,
      index: index ?? this.index,
    );
  }

  HistoricEntity toEntity() {
    return HistoricEntity(
      id: id,
      action: action,
      date: date,
      locker: locker,
      student: student,
      oldLocker: oldLocker,
      oldStudent: oldStudent,
      index: index,
    );
  }

  static Historic fromEntity(HistoricEntity entity) {
    return Historic(
      id: entity.id,
      action: entity.action,
      date: entity.date,
      locker: entity.locker,
      student: entity.student,
      oldLocker: entity.oldLocker,
      oldStudent: entity.oldStudent,
      index: entity.index,
    );
  }

  String getAction() {
    switch (action) {
      case "add":
        return "ajouté";
      case "update":
        return "modifié";
      case "delete":
        return "supprimé";
      case "attribution":
        return "attribué";
      case "unattribution":
        return "désattribué";
      default:
        return action;
    }
  }

  bool get isEmpty => this == Historic.empty;
  bool get isNotEmpty => this != Historic.empty;

  @override
  List<Object?> get props => [
        id,
        action,
        date,
        locker,
        student,
        oldLocker,
        oldStudent,
        index,
      ];
}
