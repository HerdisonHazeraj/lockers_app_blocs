import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';

abstract class UserRepository {
  // Login/register part
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> logOut();
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> resetPassword(String email);

  // Data part
  Future<void> setUserData(MyUser myUser);
  Future<MyUser> getMyUser(String myUserId);
  Stream<User?> get user;
}
