import 'package:equatable/equatable.dart';

class HistoricEntity extends Equatable {
  final String? id;
  final String action;
  final String date;
  final Map<String, dynamic>? locker;
  final Map<String, dynamic>? student;
  final Map<String, dynamic>? oldLocker;
  final Map<String, dynamic>? oldStudent;
  final int? index;

  const HistoricEntity({
    this.id,
    required this.action,
    required this.date,
    this.locker,
    this.student,
    this.oldLocker,
    this.oldStudent,
    this.index,
  });

  Map<String, Object?> toDocument() => {
        'id': id,
        'action': action,
        'date': date,
        'locker': locker,
        'student': student,
        'oldLocker': oldLocker,
        'oldStudent': oldStudent,
        'index': index,
      };

  static HistoricEntity fromDocument(Map<String, dynamic> doc) {
    return HistoricEntity(
      id: doc['id'] as String?,
      action: doc['action'] as String,
      date: doc['date'] as String,
      locker: doc['locker'] as Map<String, dynamic>?,
      student: doc['student'] as Map<String, dynamic>?,
      oldLocker: doc['oldLocker'] as Map<String, dynamic>?,
      oldStudent: doc['oldStudent'] as Map<String, dynamic>?,
      index: doc['index'] as int?,
    );
  }

  @override
  String toString() {
    return '''HistoricEntity: {
      id: $id,
      action: $action,
      date: $date,
      locker: $locker,
      student: $student,
      oldLocker: $oldLocker,
      oldStudent: $oldStudent,
      index: $index,
    }''';
  }

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
