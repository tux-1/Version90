import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faculty_project/model/account_type.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseHelper {
  static final _firestore = FirebaseFirestore.instance;
  static final _firebaseStorage = FirebaseStorage.instance;

  static Future<Map<String, dynamic>> getSchedule() async {
    final scheduleDocument =
        await _firestore.collection('schedules').doc('gadwal').get();

    return scheduleDocument.data() ?? {};
  }

  static Future<void> uploadPicture(
      {required File file,
      required AccountType accountType,
      required String uid}) async {
    final ref = _firebaseStorage.ref().child('user_images').child('$uid.jpg');

    await ref.putFile(File(file.path)).whenComplete(() => null);

    final url = await ref.getDownloadURL();
    String collection = switch (accountType) {
      AccountType.student => 'students',
      AccountType.professor => 'professors',
      AccountType.admin => 'administrators',
    };
    _firestore.collection(collection).doc(uid).update({'imageUrl': url});
  }

  static Future<void> sendNotification({
    required String title,
    required String content,
    required AccountType recipientType,
  }) async {
    _firestore.collection('notifications').add({
      'account_type':recipientType.name,
      'title': title,
      'content': content,
    });
  }
}
