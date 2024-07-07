import 'package:flutter/material.dart';

Widget customInputData(
  String txt,
) {
  return Row(
    children: [
      Text(
        txt,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        width: 5.0,
      ),
      const SizedBox(
        width: 240,
        child: TextField(
          decoration: InputDecoration(border: UnderlineInputBorder()),
        ),
      ),
    ],
  );
}
