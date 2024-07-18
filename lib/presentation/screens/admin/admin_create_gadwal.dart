import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_state.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';

class AdminCreateGadwal extends StatelessWidget {
  const AdminCreateGadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (BuildContext context, AdminState state) {
          if (state is AdminSaveScheduleSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Schedule saved successfully')),
            );
          } else if (state is AdminSaveScheduleError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.error}')),
            );
          }
        },
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
                    customBanner('إنشاء جدول المحاضرات'),
                    const SizedBox(height: 20),
                    Container(height: 1.0, color: AppColor.grey),
                    const SizedBox(height: 20.0),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          for (var day in ['الأحد', 'الإثنين', 'الثلاثاء', 'الأربعاء', 'الخميس'])
                            dayRow(day, context),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              // تجميع البيانات من الحقول
                              Map<String, dynamic> scheduleData = {
                                'days': [
                                  for (var day in ['الأحد', 'الإثنين', 'الثلاثاء', 'الأربعاء', 'الخميس'])
                                    {
                                      'day': day,
                                      'periods': [
                                        {
                                          'subject': adminCubit.getSubject(day, 1),
                                          'teacher': adminCubit.getTeacher(day, 1),
                                        },
                                        {
                                          'subject': adminCubit.getSubject(day, 2),
                                          'teacher': adminCubit.getTeacher(day, 2),
                                        },
                                        {
                                          'subject': adminCubit.getSubject(day, 3),
                                          'teacher': adminCubit.getTeacher(day, 3),
                                        },
                                        {
                                          'subject': adminCubit.getSubject(day, 4),
                                          'teacher': adminCubit.getTeacher(day, 4),
                                        },
                                        {
                                          'subject': adminCubit.getSubject(day, 5),
                                          'teacher': adminCubit.getTeacher(day, 5),
                                        },
                                      ],
                                    },
                                ],
                              };
                              // استدعاء دالة الحفظ
                              adminCubit.saveSchedule(scheduleData);
                            },
                            child: Text('حفظ الجدول'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget dayRow(String dayName, BuildContext context) {
    final AdminCubit adminCubit = context.read<AdminCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          dayName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        for (var period in [1, 2, 3, 4, 5]) // خمس فترات
          periodRow(dayName, period, context),
      ],
    );
  }

  Widget periodRow(String dayName, int periodNumber, BuildContext context) {
    final AdminCubit adminCubit = context.read<AdminCubit>();
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) => adminCubit.setSubject(dayName, periodNumber, value),
            decoration: InputDecoration(
              labelText: 'المادة للفترة $periodNumber',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            onChanged: (value) => adminCubit.setTeacher(dayName, periodNumber, value),
            decoration: InputDecoration(
              labelText: 'المعلم للفترة $periodNumber',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
