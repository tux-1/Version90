import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/cupertino.dart';

Widget customRowGadwal(
    BuildContext context,
    String txt,
    ){
  return  Directionality(
    textDirection: TextDirection.rtl,
    child: Row(
      children: [
         Text(
          txt,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(width: 10.0,),
        Container(
          height: 1.0,
          width: MediaQuery.of(context).size.width/1.8,
          color: AppColor.grey,
        ),
      ],
    ),
  );
}