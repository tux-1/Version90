import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../constants/screens.dart';

Widget customRowButton({
  required BuildContext context,
  required double padding,
}) =>
    Padding(
      padding: EdgeInsets.only(top: padding),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.loginButton,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Screens.loginScreen,
                );
              },
              minWidth: 137.0,
              child: const Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: AppColor.loginButton,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Screens.passwordChangeScreen,
                );
              },
              minWidth: 137.0,
              child: const Text(
                'تغيير كلمة المرور',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
