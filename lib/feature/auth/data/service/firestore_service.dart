import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirestoreService {
  FirestoreService();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<String, void>> saveUser({
    required String userId,
    required String email,
    required String fullName,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'id': userId,
        'fullName': fullName,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
