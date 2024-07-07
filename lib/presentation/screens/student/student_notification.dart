import 'package:faculty_project/constants/screens.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/student_cubit/student_cubit.dart';
import '../../styles/colors.dart';

class StudentNotificationScreen extends StatelessWidget {
  const StudentNotificationScreen({Key? key}) : super(key: key);

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
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: AppColor.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Center(
                              child: Text(
                                'الإشعارات',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.22,
                                  height: MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 3.0),
                                        child: Text(
                                          'فلتر',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.filter_list_outlined,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.22,
                                  height: MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 3.0),
                                        child: Text(
                                          'مسح',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.delete_forever,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 25.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 1.0,
                              color: AppColor.grey,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColor.grey,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'تغيير موعد محاضرة المادة 2',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'تم تغيير موعد المحاضرة ليصبح يوم الأحد..........',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 1.0,
                              color: AppColor.grey,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColor.grey,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'تحديد امتحانات منتصف العام الدراسي',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'سيتم بدء امتحانات منتصف العام الدراسي.........',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 1.0,
                              color: AppColor.grey,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                          ),
                          customRowButton(padding: 0.0,context: context),
                        ],
                      ),
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
