import 'package:equatable/equatable.dart';
import '../entities/locker_entity.dart';
import 'ilocker.dart';


class Locker extends ILocker with EquatableMixin {
  String? id;
  int nbKey;
  int lockNumber;
  int lockerNumber;
  String floor;
  String? idEleve;
  String job;
  String remark;
  bool? isAvailable;
  bool? isDefective;
  bool? isInaccessible;

  Locker({
    this.id,
    required this.nbKey,
    required this.lockNumber,
    required this.lockerNumber,
    required this.floor,
    this.idEleve,
    required this.job,
    required this.remark,
    this.isAvailable = true,
    this.isDefective = false,
    this.isInaccessible = false,
  });

  static final empty = Locker(
    id: '',
    nbKey: 0,
    lockNumber: 0,
    lockerNumber: 0,
    floor: '',
    idEleve: '',
    job: '',
    remark: '',
    isAvailable: true,
    isDefective: false,
    isInaccessible: false,
  );

  Locker copyWith({
    String? id,
    int? nbKey,
    int? lockNumber,
    int? lockerNumber,
    String? floor,
    String? idEleve,
    String? job,
    String? remark,
    bool? isAvailable,
    bool? isDefective,
    bool? isInaccessible,
  }) {
    return Locker(
      id: id ?? this.id,
      nbKey: nbKey ?? this.nbKey,
      lockNumber: lockNumber ?? this.lockNumber,
      lockerNumber: lockerNumber ?? this.lockerNumber,
      floor: floor ?? this.floor,
      idEleve: idEleve ?? this.idEleve,
      job: job ?? this.job,
      remark: remark ?? this.remark,
      isAvailable: isAvailable ?? this.isAvailable,
      isDefective: isDefective ?? this.isDefective,
      isInaccessible: isInaccessible ?? this.isInaccessible,
    );
  }

  LockerEntity toEntity() {
    return LockerEntity(
      id: id,
      nbKey: nbKey,
      lockNumber: lockNumber,
      lockerNumber: lockerNumber,
      floor: floor,
      idEleve: idEleve,
      job: job,
      remark: remark,
      isAvailable: isAvailable,
      isDefective: isDefective,
      isInaccessible: isInaccessible,
    );
  }

  static Locker fromEntity(LockerEntity entity) {
    return Locker(
      id: entity.id,
      nbKey: entity.nbKey,
      lockNumber: entity.lockNumber,
      lockerNumber: entity.lockerNumber,
      floor: entity.floor,
      idEleve: entity.idEleve,
      job: entity.job,
      remark: entity.remark,
      isAvailable: entity.isAvailable,
      isDefective: entity.isDefective,
      isInaccessible: entity.isInaccessible,
    );
  }

  bool get isEmpty => this == Locker.empty;
  bool get isNotEmpty => this != Locker.empty;

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
