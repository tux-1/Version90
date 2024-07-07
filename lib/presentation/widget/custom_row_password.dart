import 'package:flutter/material.dart';

Widget customRowPassword(
    BuildContext context,
    TextEditingController controller,
    TextInputAction textInputAction,
    String txt,
    String? Function(String?)? validator,
    ) {
  return Row(
    children: [
       Text(
        txt,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        ),
      ),
      const Spacer(),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: textInputAction,
          obscureText: true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            labelText: txt,
            prefixIcon: const Icon(Icons.lock),
          ),
          validator: validator,
        ),
      ),
    ],
  );
}
