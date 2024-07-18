import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/notfication_button.dart';
import 'package:flutter/material.dart';


class AdminNotificationScreen extends StatelessWidget {
  const AdminNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            color: AppColor.babyBlue,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    backgroundColor: AppColor.carosalBG,
                    child: Icon(Icons.person_outline),
                  ),
                ),
                Spacer(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('الاسم:'),
                      Text('الكود:'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              customBanner('الطالب'),
              const SizedBox(height: 20),
              Container(
                color: Colors.grey,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              labelText: 'Level:',
                              labelStyle: const TextStyle(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              labelText: 'الاسم:',
                              labelStyle: const TextStyle(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              labelText: 'GPA:',
                              labelStyle: const TextStyle(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              labelText: 'الكود:',
                              labelStyle: const TextStyle(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              customBanner('ارسال الاشعارات'),
              const SizedBox(height: 10),
              Container(
                height: 56.0,
                width: 180.0,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    )),
                child: const Center(
                  child: Text(
                    'موضوع الاشعار',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
              ),

          const TextField(decoration: InputDecoration(border: UnderlineInputBorder()),),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                height: 56.0,
                width: 180.0,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    )),
                child: const Center(
                  child: Text(
                    'محتوي الاشعار',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
              ),

              const TextField(decoration: InputDecoration(border: UnderlineInputBorder()),),
              SizedBox(
                height: MediaQuery.of(context).size.height/10,
              ),
              // Directionality(
              //   textDirection: TextDirection.rtl,
              //   child: notificationScreenButtons(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
