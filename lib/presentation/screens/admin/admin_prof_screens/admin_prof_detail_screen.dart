import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_state.dart';
import 'package:faculty_project/constants/screens.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfessorDetailScreen extends StatelessWidget {
  const ProfessorDetailScreen({super.key});

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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Screens.profDataScreen,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'البيانات الشخصية',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Screens.adminProfessorSubjectsScreen,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'المواد التدريسية',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Screens.adminProfessorDegreeScreen,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'بيانات الدرجات',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Screens.adminProfessorNotificationScreen,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'ارسال الاشعارات',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.17,
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