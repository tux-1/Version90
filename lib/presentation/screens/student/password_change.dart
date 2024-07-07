import 'package:faculty_project/business_logic/student_cubit/student_cubit.dart';
import 'package:faculty_project/constants/screens.dart';
import 'package:faculty_project/presentation/screens/student/student_home.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/custom_app_bar.dart';

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit(),
      child: BlocConsumer<StudentCubit, StudentState>(
        listener: (BuildContext context, StudentState state) {},
        builder: (BuildContext context, StudentState state) {
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
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ListView(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'كلمه المرور القديمه',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextFormField(
                              controller: studentCubit.oldpasswordcontroller,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                labelText: 'كلمه المرور القديمه',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'يجب ادخال كلمه المرور';
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'كلمه المرور الحديثه',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextFormField(
                              controller: studentCubit.newpasswordcontroller,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'يجب ادخال كلمه المرور';
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                labelText: 'كلمه المرور الحديثه',
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'تأكيد كلمة المرور',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextFormField(
                              controller: studentCubit.donepasswordcontroller,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'يجب ادخال كلمه المرور';
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                labelText: 'تأكيد كلمة المرور',
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.loginButton,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Screens.studentHomeScreen,
                              );
                            },
                            minWidth: 137.0,
                            child: const Text(
                              'رجوع',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.loginButton,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Screens.loginScreen,
                              );
                            },
                            minWidth: 137.0,
                            child: const Text(
                              'حفظ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.loginButton,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Screens.loginScreen,
                          );
                        },
                        minWidth: 137.0,
                        child: const Text(
                          'تسجيل الخروج',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
