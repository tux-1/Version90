import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_state.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcademicRegistrationDataScreen extends StatelessWidget {
  const AcademicRegistrationDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AdminCubit(),
      child: BlocConsumer<AdminCubit,AdminState>(
        listener: (BuildContext context, AdminState state) {  },
        builder: (BuildContext context, AdminState state) =>
            Scaffold(
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
                const SizedBox(height: 20),
                customBanner('بيانات التسجيل الأكاديمي'),
                const SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(2),
                    },
                    children: [
                      const TableRow(
                        decoration: BoxDecoration(color: Colors.grey),
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('الكود',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('المادة',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('الساعات',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      // Add more TableRow widgets here to fill the table with actual data
                      for (var i = 0; i < 4; i++)
                        const TableRow(
                          children: [
                            Center(child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(''),
                            )),
                            Center(child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(''),
                            )),
                            Center(child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(''),
                            )),
                          ],
                        ),
                      const TableRow(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(''),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(''),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(''),
                            ),
                          ),
                        ],
                      ),
                      const TableRow(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'مجموع الساعات',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox.shrink(), // Empty cell to span
                          SizedBox.shrink(), // Empty cell to span
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                customRowButton(context: context, padding: 0.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
