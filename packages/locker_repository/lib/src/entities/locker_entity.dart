import 'package:equatable/equatable.dart';

class LockerEntity extends Equatable {
  final String? id;
  final int nbKey;
  final int lockNumber;
  final int lockerNumber;
  final String floor;
  final String? idEleve;
  final String job;
  final String remark;
  final bool? isAvailable;
  final bool? isDefective;
  final bool? isInaccessible;

  const LockerEntity({
    this.id,
    required this.nbKey,
    required this.lockNumber,
    required this.lockerNumber,
    required this.floor,
    this.idEleve,
    required this.job,
    required this.remark,
    this.isAvailable,
    this.isDefective = false,
    this.isInaccessible = false,
  });

  Map<String, Object?> toDocument() => {
        'id': id,
        'nbKey': nbKey,
        'lockNumber': lockNumber,
        'lockerNumber': lockerNumber,
        'floor': floor,
        'idEleve': idEleve,
        'job': job,
        'remark': remark,
        'isAvailable': isAvailable,
        'isDefective': isDefective,
        'isInaccessible': isInaccessible,
      };

  static LockerEntity fromDocument(Map<String, dynamic> doc) {
    return LockerEntity(
      id: doc['id'] as String?,
      nbKey: doc['nbKey'] as int,
      lockNumber: doc['lockNumber'] as int,
      lockerNumber: doc['lockerNumber'] as int,
      floor: doc['floor'] as String,
      idEleve: doc['idEleve'] as String?,
      job: doc['job'] as String,
      remark: doc['remark'] as String,
      isAvailable: doc['isAvailable'] as bool?,
      isDefective: doc['isDefective'] as bool?,
      isInaccessible: doc['isInaccessible'] as bool?,
    );
  }

  @override
  String toString() {
    return '''LockerEntity: {
      id: $id
      nbKey: $nbKey
      lockNumber: $lockNumber
      lockerNumber: $lockerNumber
      floor: $floor
      idEleve: $idEleve
      job: $job
      remark: $remark
      isAvailable: $isAvailable
      isDefective: $isDefective
      isInaccessible: $isInaccessible
    }''';
  }

  @override
  List<Object?> get props => [
        id,
        nbKey,
        lockNumber,
        lockerNumber,
        floor,
        idEleve,
        job,
        remark,
        isAvailable,
        isDefective,
        isInaccessible,
      ];
}
