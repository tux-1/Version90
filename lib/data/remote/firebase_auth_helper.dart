import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faculty_project/model/account_type.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  static Future<void> createAccount({
    required AccountType type,
    required String email,
    required String password,
  }) async {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    FirebaseFirestore.instance
        .collection('accounts-types')
        .doc(userCredential.user?.uid)
        .set({
      'account_type': type.name,
    });
  }
}
