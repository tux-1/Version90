import 'dart:io';
import 'dart:typed_data';

import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/data/remote/firebase_auth_helper.dart';
import 'package:faculty_project/model/account_type.dart';
import 'package:faculty_project/model/professor_model.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_input_data.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../business_logic/admin_cubit/admin_state.dart';
import '../../login/login_screen.dart';

class ProfessorForm extends StatefulWidget {
  const ProfessorForm({super.key});

  @override
  State<ProfessorForm> createState() => _ProfessorFormState();
}

class _ProfessorFormState extends State<ProfessorForm> {
  XFile? picture;
  Uint8List? uint8listPicture;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (BuildContext context, AdminState state) {
          if (state is AdminProfessorAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم إضافة الأستاذ الجامعي بنجاح!')),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginScreen()), //edit here
            );
          } else if (state is AdminProfessorAddError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('حدث خطأ أثناء إضافة الأستاذ الجامعي: ${state.error}')),
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
                      customBanner('أستاذ جامعي'),
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
                      customInputData(txt: 'الاســــــــــــــم:',
                          controller: adminCubit.professorNameController),
                      customInputData(txt: 'الكـــــــــــــــود:',
                          controller: adminCubit.professorCodeController),
                      customInputData(txt: 'الديـــــــــــــانة:',
                          controller: adminCubit.professorReligionController),
                      customInputData(txt: 'الجنــــــــــــس:',
                          controller: adminCubit.professorGenderController),
                      customInputData(txt: 'الجنسـيــــــــــة:',
                          controller: adminCubit.professorNationalityController),
                      customInputData(txt: 'تاريخ الميـــــلاد:',
                          controller: adminCubit.professorBirthDateController),
                      customInputData(txt: 'محل الميــــــلاد:',
                          controller: adminCubit.professorBirthPlaceController),
                      customInputData(txt: 'الرقم القومـــــي:',
                          controller: adminCubit.professorNationalIdController),
                      customInputData(txt: 'العنـــــــــــــوان:',
                          controller: adminCubit.professorAddressController),
                      customInputData(txt: 'التليفون الأرضي:',
                          controller: adminCubit.professorLandlineController),
                      customInputData(txt: 'المحمــــــــــول:',
                          controller: adminCubit.professorMobileController),
                      customInputData(txt: 'البريد الإلكتروني:',
                          controller: adminCubit.professorEmailController),
                      customInputData(txt: 'كلمه السر :',
                          controller: adminCubit.adminEmailController),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: IconButton(
                          onPressed: () async {
                            final professor = Professor(
                              name: adminCubit.professorNameController.text,
                              code: adminCubit.professorCodeController.text,
                              religion: adminCubit.professorReligionController.text,
                              gender: adminCubit.professorGenderController.text,
                              nationality:
                              adminCubit.professorNationalityController.text,
                              birthDate:
                              adminCubit.professorBirthDateController.text,
                              birthPlace:
                              adminCubit.professorBirthPlaceController.text,
                              nationalId:
                              adminCubit.professorNationalIdController.text,
                              address: adminCubit.professorAddressController.text,
                              phone: adminCubit.professorLandlineController.text,
                              mobile: adminCubit.professorMobileController.text,
                              email: adminCubit.professorEmailController.text,
                            );
                             if (picture == null) {
                              adminCubit.throwError('Select a picture');
                            }
                            final id = await FirebaseAuthHelper.createAccount(
                              type: AccountType.professor,
                              email: adminCubit.professorEmailController.text,
                              password: adminCubit.adminEmailController.text,
                              file: File(picture!.path)
                            ).onError(
                              (error, stackTrace) {
                                adminCubit.throwError(error.toString());
                                return '';
                              },
                            );
                            adminCubit.addProfessor(professor, id);
                            adminCubit.clearAdministratorControllers();
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
