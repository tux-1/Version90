import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/presentation/screens/login/login_screen.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_input_data.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/admin_cubit/admin_state.dart';
import '../../../../model/adminstrator_model.dart';

class AdminstratorForm extends StatelessWidget {
  const AdminstratorForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (BuildContext context, AdminState state) {
          if (state is AdminAdministratorAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم إضافة الإداري بنجاح!'),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          } else if (state is AdminAdministratorAddError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('حدث خطأ أثناء إضافة الإداري: ${state.error}')),
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
                      customBanner('إداري'),
                      const SizedBox(height: 10.0),
                      customInputData(txt: 'الاســــــــــــــم:',
                          controller: adminCubit.adminNameController),
                      customInputData(txt: 'الكـــــــــــــــود:',
                          controller: adminCubit.adminCodeController),
                      customInputData(txt: 'الديـــــــــــــانة:',
                          controller: adminCubit.adminReligionController),
                      customInputData(txt: 'الجنــــــــــــس:',
                          controller: adminCubit.adminGenderController),
                      customInputData(txt: 'الجنسـيــــــــــة:',
                          controller: adminCubit.adminNationalityController),
                      customInputData(txt: 'تاريخ الميـــــلاد:',
                          controller: adminCubit.adminBirthDateController),
                      customInputData(txt: 'محل الميــــــلاد:',
                          controller: adminCubit.adminBirthPlaceController),
                      customInputData(txt: 'الرقم القومـــــي:',
                          controller: adminCubit.adminNationalIdController),
                      customInputData(txt: 'العنـــــــــــــوان:',
                          controller: adminCubit.adminAddressController),
                      customInputData(txt: 'التليفون الأرضي:',
                          controller: adminCubit.adminLandlineController),
                      customInputData(txt: 'المحمــــــــــول:',
                          controller: adminCubit.adminMobileController),
                      customInputData(txt: 'البريد الإلكتروني:',
                          controller: adminCubit.adminEmailController),
                      const SizedBox(height: 10.0),
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
