import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

Widget customItemContainer({
  required BuildContext context,
  required String txt,
  required void Function()? function,
}) =>
    Container(
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        onPressed: function,
        minWidth: 224.0,
        child: Center(
          child: Text(
            txt,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
