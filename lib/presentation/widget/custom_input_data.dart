import 'package:flutter/material.dart';

Widget customInputData(
    {required TextEditingController controller,String? txt,Function(String)? onchange,}
    ) {
  return Row(
    children: [
      Text(
        txt!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        width: 5.0,
      ),
      SizedBox(
        width: 240,
        child: TextField(
          //onChanged: onchange,
          controller: controller,
          decoration: const InputDecoration(border: UnderlineInputBorder()),
        ),
      ),
    ],
  );
}
