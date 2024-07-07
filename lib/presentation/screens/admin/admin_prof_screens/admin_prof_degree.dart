import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:faculty_project/presentation/widget/custom_row_subject.dart';
import 'package:flutter/material.dart';

class AdminProfessorDegreeScreen extends StatelessWidget {
  const AdminProfessorDegreeScreen({super.key});

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
              customBanner('بيانات الدرجات'),
              const SizedBox(height: 10),
              customRowSubject(
                txt: 'Mid-term grades subject 1',
                iconData: Icons.picture_as_pdf_rounded,
                color: const Color(0xFFEF5350),
              ),
              Container(
                height: 1.0,
                color: Colors.grey,
              ),
              customRowSubject(
                txt: 'Mid-term grades subject 2',
                iconData: Icons.picture_as_pdf_rounded,
                color: const Color(0xFFEF5350),
              ),
              Container(
                height: 1.0,
                color: Colors.grey,
              ),
              customRowSubject(
                txt: 'Final exam grades subject 1',
                iconData: Icons.picture_as_pdf_rounded,
                color: const Color(0xFFEF5350),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height /6,
              ),
              customRowButton(context: context, padding: 0.0),
            ],
          ),
        ),
      ),
    );
  }
}
