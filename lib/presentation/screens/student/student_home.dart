import 'package:faculty_project/presentation/screens/student/student_academic.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_item_container.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:faculty_project/presentation/widget/student_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/student_cubit/student_cubit.dart';
import '../../../constants/screens.dart';
import '../../styles/colors.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit(),
      child: BlocConsumer<StudentCubit, StudentState>(
        listener: (context, state) async {},
        builder: (context, state) {
          return Builder(builder: (context) {
            final StudentCubit studentCubit = context.read<StudentCubit>();
            return Scaffold(
              appBar: const CustomAppBar(
                appBarWidget: StudentAppBar(),
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
                                context,
                                Screens.studentDataScreen,
                              );
                            }),
                        const SizedBox(
                          height: 20.0,
                        ),
                        customItemContainer(
                          context: context,
                          txt: 'التسجيل الأكاديمي',
                          function: () {
                            Navigator.pushNamed(
                              context,
                              Screens.studentAcademicScreen,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        customItemContainer(
                          context: context,
                          txt: 'الجدول الدراسي',
                          function: () {
                            Navigator.pushNamed(
                              context,
                              Screens.studentTableScreen,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        customItemContainer(
                          context: context,
                          txt: 'مخطط المدرجات',
                          function: () {
                            Navigator.pushNamed(
                              context,
                              Screens.studentModargatScreen,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        customItemContainer(
                          context: context,
                          txt: 'تسجيل الحضور',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.studentAccessScreen);
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        customItemContainer(
                          context: context,
                          txt: 'المقررات',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.studentSubjectsScreen);
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // customItemContainer(
                        //     context: context,
                        //     txt: 'نماذج الامتحانات',
                        //     function: () {
                        //       Navigator.pushNamed(
                        //           context, Screens.studentQuesScreen);
                        //     }),
                        // const SizedBox(
                        //   height: 20.0,
                        // ),
                        customItemContainer(
                          context: context,
                          txt: 'الإشعارات',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.studentNotificationScreen);
                          },
                        ),
                        customRowButton(padding: 90.0, context: context),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}