import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_state.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/student_info_fields.dart';

class AcademicRegistrationDataScreen extends StatelessWidget {
  final String? uid;
  const AcademicRegistrationDataScreen({super.key, this.uid});

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
                StudentInfoFields(uid: uid),
                const SizedBox(height: 20),
                customBanner('بيانات التسجيل الأكاديمي'),
                const SizedBox(height: 10),
                FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('students')
                      .doc(uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return const Center(child: Text('Student not found.'));
                    }

                    final data = snapshot.data!.data() as Map<String, dynamic>?;
                    final subjects = data?['subjects'] as Map<String, dynamic>?;

                    if (subjects == null) {
                      return const Center(child: Text('No subjects found.'));
                    }

                    // Generate table rows based on subjects
                    final tableRows = subjects.entries.map((entry) {
                      final code = entry.key;
                      final name = entry.value;
                      return TableRow(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(code),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(name),
                            ),
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('3'), // Fixed value for hours
                            ),
                          ),
                        ],
                      );
                    }).toList();

                    return Directionality(
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('المادة',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('الساعات',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                          ...tableRows, // Add the dynamically generated rows
                        ],
                      ),
                    );
                  },
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
