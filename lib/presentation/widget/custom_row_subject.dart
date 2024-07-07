import 'package:flutter/material.dart';

Widget customRowSubject({
  required String txt,
  required IconData iconData,
  Color color = Colors.black,
}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Row(
      children: [
        Icon(
          iconData,
          size: 40.0,
          color: color,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          txt,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            size: 40.0,
          ),
        ),
      ],
    ),
  );
}
