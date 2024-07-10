import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_input_data.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/admin_cubit/admin_state.dart';
import '../../../../model/affiars_model.dart';
import '../../login/login_screen.dart';

class StudentAffairsForm extends StatelessWidget {
  const StudentAffairsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (BuildContext context, AdminState state) {
          if (state is AdminAffairsAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'تم إضافة الطالب بنجاح!',
                ),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginScreen()), //edit here
            );
          } else if (state is AdminAffairsAddError) {
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
                      customInputData(txt: 'الاســــــــــــــم:',
                          controller: adminCubit.affairsNameController),
                      customInputData(txt: 'الكـــــــــــــــود:',
                          controller: adminCubit.affairsCodeController),
                      customInputData(txt: 'الديـــــــــــــانة:',
                          controller: adminCubit.affairsReligionController),
                      customInputData(txt: 'الجنــــــــــــس:',
                          controller: adminCubit.affairsGenderController),
                      customInputData(txt: 'الجنسـيــــــــــة:',
                          controller: adminCubit.affairsNationalityController),
                      customInputData(txt: 'تاريخ الميـــــلاد:',
                          controller: adminCubit.affairsBirthDateController),
                      customInputData(txt: 'محل الميــــــلاد:',
                          controller: adminCubit.affairsBirthPlaceController),
                      customInputData(txt: 'الرقم القومـــــي:',
                          controller: adminCubit.affairsNationalIdController),
                      customInputData(txt: 'العنـــــــــــــوان:',
                          controller: adminCubit.affairsAddressController),
                      customInputData(txt: 'التليفون الأرضي:',
                          controller: adminCubit.affairsLandlineController),
                      customInputData(txt: 'المحمــــــــــول:',
                          controller: adminCubit.affairsMobileController),
                      customInputData(txt: 'البريد الإلكتروني:',
                          controller: adminCubit.affairsEmailController),
                      const SizedBox(height: 10.0),
                      Center(
                        child: IconButton(
                          onPressed: () {
                            final affairs = Affairs(
                              name: adminCubit.affairsNameController.text,
                              code: adminCubit.affairsCodeController.text,
                              religion: adminCubit.affairsReligionController.text,
                              gender: adminCubit.affairsGenderController.text,
                              nationality: adminCubit.affairsNationalityController.text,
                              birthDate: adminCubit.affairsBirthDateController.text,
                              birthPlace: adminCubit.affairsBirthPlaceController.text,
                              nationalId: adminCubit.affairsNationalIdController.text,
                              address: adminCubit.affairsAddressController.text,
                              phone: adminCubit.affairsLandlineController.text,
                              mobile: adminCubit.affairsMobileController.text,
                              email: adminCubit.affairsEmailController.text,
                            );
                            adminCubit.addAffairs(affairs);
                            adminCubit.clearStudentControllers();
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
