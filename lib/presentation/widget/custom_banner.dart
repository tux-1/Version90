import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

Widget customBanner(
  String txt,
) =>
    Container(
      height: 56.0,
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child:  Center(
        child: Text(
          txt,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
