import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locker_repository/locker_repository.dart';
import 'dart:developer' as dev;
import 'package:uuid/uuid.dart';

class FirebaseLockerRepository implements LockerRepository {
  final lockersCollection = FirebaseFirestore.instance.collection("lockers");

  @override
  Future<Locker> createLocker(Locker locker) async {
    try {
      locker.id = const Uuid().v1();
      await lockersCollection
          .doc(locker.id)
          .set(locker.toEntity().toDocument());

      return locker;
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Locker> deleteLocker(Locker locker) async {
    try {
      await lockersCollection.doc(locker.id).delete();
      return locker;
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Locker> updateLocker(Locker locker) async {
    try {
      await lockersCollection
          .doc(locker.id)
          .update(locker.toEntity().toDocument());
      return locker;
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Locker>> getLockers() async {
    try {
      return lockersCollection.get().then((value) => value.docs
          .map(
            (e) => Locker.fromEntity(LockerEntity.fromDocument(e.data())),
          )
          .toList());
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }
}
