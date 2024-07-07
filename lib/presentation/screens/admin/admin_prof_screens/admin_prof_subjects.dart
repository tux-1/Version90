import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:faculty_project/presentation/widget/custom_row_subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminProfessorSubjectsScreen extends StatelessWidget {
  const AdminProfessorSubjectsScreen({super.key});

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
              customBanner('الاساتذة'),
              const SizedBox(height: 20),
              Container(
                color: Colors.grey,
                padding: const EdgeInsets.all(10),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                labelText: 'الاسم:',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                labelText: 'الكود:',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              customBanner('المواد التدريسية'),
              const SizedBox(height: 10),
              customRowSubject(txt: 'Subject 1',iconData: CupertinoIcons.book),
              Container(
                height: 1.0,
                color: Colors.grey,
              ),
              customRowSubject(txt: 'Subject 2',iconData: CupertinoIcons.book),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 40.0,
                  ),
                ),
              ),
              customRowButton(context: context, padding:80.0),
            ],
          ),
        ),
      ),
    );
  }
}
