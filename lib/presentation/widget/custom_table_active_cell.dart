import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

Widget customTableActiveCell(
  String txt,
) =>
    Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: AppColor.tableActiveCell,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(txt),
      ),
    );

Widget customTableCardCell() => Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: AppColor.cardGray,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
    );
