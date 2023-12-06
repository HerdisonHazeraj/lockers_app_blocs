import 'package:locker_repository/src/models/locker.dart';

abstract class LockerRepository {
  Future<Locker> createLocker(Locker locker);
  Future<Locker> deleteLocker(Locker locker);
  Future<Locker> updateLocker(Locker locker);

  Future<List<Locker>> getLockers();
}
