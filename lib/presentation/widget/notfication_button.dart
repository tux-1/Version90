import 'package:faculty_project/data/remote/firebase_helper.dart';
import 'package:faculty_project/model/account_type.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class NotficationSreenButtons extends StatelessWidget {
  final String title;
  final String content;
  final AccountType recipientType;
  final String txt1;
  final String txt2;

  const NotficationSreenButtons({
    super.key,
    this.txt1 = 'حفظ',
    this.txt2 = 'الغاء',
    required this.title,
    required this.content,
    required this.recipientType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          onPressed: () {
            FirebaseHelper.sendNotification(
              content: content,
              recipientType: recipientType,
              title: title,
            ).then(
              (value)  {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم إضافة الإشعار بنجاح!'),
                  ),
                );
                Navigator.pop(context);
              },
            );
          },
          child: Text(
            txt1,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          onPressed: () {},
          child: Text(
            txt2,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
