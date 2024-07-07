import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

Widget notificationScreenButtons({
  String txt1 = 'حفظ',
  String txt2 = 'الغاء',
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
        onPressed: () {},
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
