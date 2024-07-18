import 'dart:io';
import 'dart:typed_data';

import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_state.dart';
import 'package:faculty_project/data/remote/firebase_auth_helper.dart';
import 'package:faculty_project/model/account_type.dart';
import 'package:faculty_project/presentation/screens/login/login_screen.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_input_data.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../model/student_model.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  XFile? picture;
  Uint8List? uint8listPicture;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (BuildContext context, AdminState state) {
          if (state is AdminStudentAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم إضافة الطالب بنجاح!'),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          } else if (state is AdminStudentAddError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('حدث خطأ أثناء إضافة الطالب: ${state.error}')),
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
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      customBanner('طالب'),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          const Text(
                            'الصورة:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 50),
                          IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              picture = await picker.pickImage(
                                source: ImageSource.gallery,
                              );

                              uint8listPicture = await picture?.readAsBytes();
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: uint8listPicture == null
                                ? null
                                : MemoryImage(uint8listPicture!),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      customInputData(
                          txt: 'الاســــــــــــــم:',
                          controller: adminCubit.studentNameController),
                      customInputData(
                          txt: 'الكـــــــــــــــود:',
                          controller: adminCubit.studentCodeController),
                      customInputData(
                          txt: 'الديـــــــــــــانة:',
                          controller: adminCubit.studentReligionController),
                      customInputData(
                          txt: 'الجنــــــــــــس:',
                          controller: adminCubit.studentGenderController),
                      customInputData(
                          txt: 'الجنسـيــــــــــة:',
                          controller: adminCubit.studentNationalityController),
                      customInputData(
                          txt: 'تاريخ الميـــــلاد:',
                          controller: adminCubit.studentBirthDateController),
                      customInputData(
                          txt: 'محل الميــــــلاد:',
                          controller: adminCubit.studentBirthPlaceController),
                      customInputData(
                          txt: 'الرقم القومـــــي:',
                          controller: adminCubit.studentNationalIdController),
                      customInputData(
                          txt: 'العنـــــــــــــوان:',
                          controller: adminCubit.studentAddressController),
                      customInputData(
                          txt: 'التليفون الأرضي:',
                          controller: adminCubit.studentLandlineController),
                      customInputData(
                          txt: 'المحمــــــــــول:',
                          controller: adminCubit.studentMobileController),
                      customInputData(
                          txt: 'البريد الإلكتروني:',
                          controller: emailController),
                      customInputData(
                          txt: 'كلمة المرور:',
                          controller: passwordController,
                          obscureText: true), // حقل كلمة المرور

                      const SizedBox(height: 10.0),
                      Center(
                        child: IconButton(
                          onPressed: () async {
                            final student = Student(
                              name: adminCubit.studentNameController.text,
                              code: adminCubit.studentCodeController.text,
                              religion:
                                  adminCubit.studentReligionController.text,
                              gender: adminCubit.studentGenderController.text,
                              nationality:
                                  adminCubit.studentNationalityController.text,
                              birthDate:
                                  adminCubit.studentBirthDateController.text,
                              birthPlace:
                                  adminCubit.studentBirthPlaceController.text,
                              nationalId:
                                  adminCubit.studentNationalIdController.text,
                              address: adminCubit.studentAddressController.text,
                              phone: adminCubit.studentLandlineController.text,
                              mobile: adminCubit.studentMobileController.text,
                              email: emailController
                                  .text, // استخدام البريد الإلكتروني
                              password: passwordController
                                  .text, // استخدام كلمة المرور
                            );
                            if (uint8listPicture == null) {
                              print(picture);
                              adminCubit.throwError('Select a picture');
                              return;
                            }
                            final id = await FirebaseAuthHelper.createAccount(
                                    type: AccountType.student,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    file: File(picture!.path))
                                .onError(
                              (error, stackTrace) {
                                adminCubit.throwError(error.toString());
                                return '';
                              },
                            );
                            await adminCubit.addStudent(student, id);
                            adminCubit.clearStudentControllers();
                            emailController.clear();
                            passwordController
                                .clear(); // مسح حقل كلمة المرور بعد الإضافة
                          },
                          icon: const Icon(Icons.save, size: 30.0),
                        ),
                      ),
                      customRowButton(context: context, padding: 5.0),
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
