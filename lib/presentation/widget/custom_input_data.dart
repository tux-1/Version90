import 'package:flutter/material.dart';

Widget customInputData({
  required TextEditingController controller,
  String? txt,
  Function(String)? onchange,
  bool obscureText = false, // إضافة هذا السطر
}) {
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
          onChanged: onchange, // قم بإلغاء تعليق هذه السطر إذا كنت بحاجة إليه
          controller: controller,
          obscureText: obscureText, // استخدام حقل obscureText هنا
          decoration: const InputDecoration(border: UnderlineInputBorder()),
        ),
      ),
    ],
  );
}
