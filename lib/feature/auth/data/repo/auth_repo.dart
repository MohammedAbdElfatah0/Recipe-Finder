import 'package:dartz/dartz.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:recipe_finder/feature/auth/data/service/firestore_service.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirestoreService _firestoreService = FirestoreService();

  //sign up

  Future<Either<String, void>> register({
    required String email,

    required String password,

    required String fullName,
  }) async {
    try {
      final res = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,

        password: password,
      );

      //saving in firestore

      await _firestoreService.saveUser(
        userId: res.user!.uid,

        email: email,

        fullName: fullName,
      );

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  //sign in
  Future<Either<String, void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  // sgin in with google
}
