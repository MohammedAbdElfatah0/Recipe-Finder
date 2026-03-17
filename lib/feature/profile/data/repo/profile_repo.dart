import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipe_finder/feature/auth/data/service/firestore_service.dart';
import 'package:recipe_finder/core/services/shared_prefs_service.dart';

class ProfileRepo {
  ProfileRepo(this._firestoreService);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService;
  User? get currentUser => _auth.currentUser;
  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>>
  getDateUser() async {
    try {
      final user = _auth.currentUser;
      final userData = await _firestoreService.getUser(user!.uid);
      return userData;
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> signOut() async {
    try {
      await _auth.signOut();
      // Clear login state from SharedPreferences
      await SharedPrefsService.clearLoginState();
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
