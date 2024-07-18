import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  static final _firestore = FirebaseFirestore.instance;

  static Future<Map<String, dynamic>> getSchedule() async {
    final scheduleDocument =
        await _firestore.collection('schedules').doc('gadwal').get();
    
    return scheduleDocument.data() ?? {};
  }
}
