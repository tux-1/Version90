import 'package:faculty_project/model/account_type.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  static Future<String> createAccount({
    required AccountType type,
    required String email,
    required String password,
  }) async {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = userCredential.user?.uid;
    print("User UID: $uid");

    return uid ?? '';
  }
}
