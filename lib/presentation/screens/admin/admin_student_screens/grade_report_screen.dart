import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_state.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/build_level_table.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradeReportScreen extends StatelessWidget {
  const GradeReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (BuildContext context, AdminState state) {},
        builder: (BuildContext context, AdminState state) => Scaffold(
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
            child: ListView(
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
                                labelStyle:
                                const TextStyle(color: Colors.black),
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
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                labelText: 'GPA:',
                                labelStyle:
                                const TextStyle(color: Colors.black),
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
                const SizedBox(height: 10.0,),
                customBanner('بيانات الدرجات'),
                const SizedBox(height: 10),
                buildLevelTable('Level 0', [
                  ['subject 1', '100', 'A+'],
                  ['subject 2', '100', 'A+'],
                  ['subject 3', '100', 'A+'],
                  ['subject 4', '100', 'A+'],
                ]),
                const SizedBox(height: 16),
                buildLevelTable('Level 1', [
                  ['subject 5', '100', 'A+'],
                  ['subject 6', '100', 'A+'],
                  ['subject 7', '100', 'A+'],
                  ['subject 8', '100', 'A+'],
                ]),
                const SizedBox(height: 16),
                buildLevelTable('Level 2', [
                  ['subject 9', '100', 'A+'],
                  ['subject 10', '100', 'A+'],
                  ['subject 11', '100', 'A+'],
                  ['subject 12', '100', 'A+'],
                ],
                ),
                const SizedBox(height: 16),
                buildLevelTable('Level 3', [
                  ['subject 13', '100', 'A+'],
                  ['subject 14', '100', 'A+'],
                  ['subject 15', '100', 'A+'],
                  ['subject 16', '100', 'A+'],
                ],
                ),
                const SizedBox(height: 16),
                buildLevelTable('Level 4', [
                  ['subject 17', '100', 'A+'],
                  ['subject 18', '100', 'A+'],
                  ['subject 19', '100', 'A+'],
                  ['subject 20', '100', 'A+'],
                ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                customRowButton(context: context, padding: 0.0),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
