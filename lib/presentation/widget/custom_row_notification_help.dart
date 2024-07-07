import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

Widget customRowNotificationHelp(
    BuildContext context,
    )=> Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    GestureDetector(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.22,
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 3.0),
              child: Text(
                'فلتر',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Icon(
              Icons.filter_list_outlined,
              color: Colors.blue,
            )
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.22,
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 3.0),
              child: Text(
                'مسح',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Icon(
              Icons.delete_forever,
              color: Colors.blue,
            )
          ],
        ),
      ),
    ),
  ],
);


Widget customNotificationItem(
    String txt1,
    String txt2,
    )=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8.0),
  child: Row(
    children: [
      const CircleAvatar(
        backgroundColor: AppColor.grey,
      ),
      const SizedBox(
        width: 5.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            txt2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const Spacer(),
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
    ],
  ),
);