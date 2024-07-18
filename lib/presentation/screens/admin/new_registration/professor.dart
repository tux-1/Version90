import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_input_data.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/admin_cubit/admin_state.dart';
import '../../../../model/adminstrator_model.dart';
import '../../login/login_screen.dart';

class ProfessorForm extends StatelessWidget {
  const ProfessorForm({super.key});

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
                          onPressed: () {
                            final administrator = Administrator(
                              name: adminCubit.adminNameController.text,
                              code: adminCubit.adminCodeController.text,
                              religion: adminCubit.adminReligionController.text,
                              gender: adminCubit.adminGenderController.text,
                              nationality:
                              adminCubit.adminNationalityController.text,
                              birthDate:
                              adminCubit.adminBirthDateController.text,
                              birthPlace:
                              adminCubit.adminBirthPlaceController.text,
                              nationalId:
                              adminCubit.adminNationalIdController.text,
                              address: adminCubit.adminAddressController.text,
                              phone: adminCubit.adminLandlineController.text,
                              mobile: adminCubit.adminMobileController.text,
                              email: adminCubit.adminEmailController.text,
                            );
                            adminCubit.addAdministrator(administrator);
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
