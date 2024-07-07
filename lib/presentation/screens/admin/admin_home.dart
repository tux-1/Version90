import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_state.dart';
import 'package:faculty_project/constants/screens.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_item_container.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (BuildContext context, AdminState state) {},
        builder: (BuildContext context, AdminState state) {
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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      customItemContainer(
                          context: context,
                          txt: 'البيانات الشخصية',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.adminDataScreen);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customItemContainer(
                        context: context,
                        txt: 'الطالب',
                        function: () {
                          Navigator.pushNamed(context, Screens.adminStudentScreen);
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customItemContainer(
                          context: context,
                          txt: 'الاساتذة',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.adminProfessorScreen);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Screens.adminCreateGadwal,
                            );
                          },
                          minWidth: 224.0,
                          child: const Center(
                            child: Text(
                              'انشاء جدول المحاضرات',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customItemContainer(
                          context: context,
                          txt: 'مجموعات الطلبة',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.adminStudentGroup);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customItemContainer(
                          context: context,
                          txt: 'ارسال الإشعارات',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.notificationSend);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customItemContainer(
                          context: context,
                          txt: 'تسجيل جديد',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.adminNewRegistration);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customRowButton(padding: 150, context: context),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
