import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faculty_project/data/remote/firebase_helper.dart';
import 'package:faculty_project/model/account_type.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  static Future<String> createAccount({
    required AccountType type,
    required String email,
    required String password,
    required File file,
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

    FirebaseHelper.uploadPicture(
      file: file,
      accountType: type,
      uid: userCredential.user!.uid,
    );

    final uid = userCredential.user?.uid;
    print("User UID: $uid");

    return uid ?? '';
  }
}
