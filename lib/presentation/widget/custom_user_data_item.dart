import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

Widget customUserDataItem({
  required BuildContext context,
  required String txt,
  required String data,
}) =>
    Row(
      children: [
        Text(
          txt,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Container(
          child: Center(
            child: Text(
              data,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.57,
          height: 21.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            color: AppColor.grey,
          ),
        ),
      ],
    );
