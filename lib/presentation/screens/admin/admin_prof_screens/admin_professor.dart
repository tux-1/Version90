import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_state.dart';
import 'package:faculty_project/constants/screens.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminProfessorScreen extends StatelessWidget {
  const AdminProfessorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
          listener: (BuildContext context, AdminState state) {},
          builder: (BuildContext context, AdminState state) {
            final AdminCubit adminCubit = context.read<AdminCubit>();
            return Scaffold(
              appBar: CustomAppBar(
                appBarWidget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    color: AppColor.babyBlue,
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColor.carosalBG,
                            child: Icon(
                              Icons.person_outline,
                            ),
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
                    customBanner(
                      'الاساتذة',
                    ),
                    const Center(
                      child: Icon(
                        Icons.account_circle,
                        size: 100,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'الاستاذ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'الكود',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Radio(
                          value: false,
                          groupValue: adminCubit.isCodeSelected,
                          onChanged: (bool? value) {
                            if (value != null) {
                              adminCubit.toggleSelection(value);
                            }
                          },
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'الاسم',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Radio(
                          value: true,
                          groupValue: adminCubit.isCodeSelected,
                          onChanged: (bool? value) {
                            if (value != null) {
                              adminCubit.toggleSelection(value);
                            }
                          },
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: adminCubit.isCodeSelected
                            ? 'ادخل الاسم'
                            : 'ادخل الكود',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Screens.adminProfessorDetailScreen,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.loginButton,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                        ),
                        child: const Text(
                          'بحث',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    customRowButton(context: context, padding: 0.0),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
