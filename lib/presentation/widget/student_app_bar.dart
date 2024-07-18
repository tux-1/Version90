import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/student_cubit/student_cubit.dart';
import 'custom_app_bar.dart';

class StudentAppBar extends StatelessWidget {
  const StudentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(builder: (context, state) {
      final studentCubit = context.read<StudentCubit>();
      return CustomAppBar(
        appBarWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            color: AppColor.babyBlue,
            child:  Row(
              children: [
                const Padding(
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
                const Spacer(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('الاسم: ${studentCubit.studentData?.name}'),
                      Text('الكود: ${studentCubit.studentData?.code}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
