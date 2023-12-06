import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/entities/entities.dart';
import 'package:user_repository/src/models/my_user.dart';
import 'package:user_repository/src/user_repository.dart';
import 'dart:developer' as dev;

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection("users");

  // Login/register part
  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );

      myUser = myUser.copyWith(id: user.user!.uid);

      return myUser;
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      await _firebaseAuth.signInWithPhoneNumber(phoneNumber);
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  // Data part
  @override
  Future<void> setUserData(MyUser user) async {
    dev.log(usersCollection.toString());
    try {
      await usersCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> getMyUser(String myUserId) async {
    try {
      return usersCollection.doc(myUserId).get().then(
        (value) {
          final user = MyUser.fromEntity(
            MyUserEntity.fromDocument(
              value.data()!,
            ),
          );
          return user;
        },
      );
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }
}
