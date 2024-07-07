import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_input_data.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/admin_cubit/admin_state.dart';

class StudentForm extends StatelessWidget {
  const StudentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AdminCubit(),
      child: BlocConsumer<AdminCubit,AdminState>(
        listener: (BuildContext context,AdminState state) {  },
        builder: (BuildContext context, AdminState state) {
          return  Scaffold(
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
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      customBanner('طالب'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      customInputData('الاســــــــــــــم:'),
                      customInputData('الكـــــــــــــــود:'),
                      customInputData('الديـــــــــــــانة:'),
                      customInputData('الجنــــــــــــس:'),
                      customInputData('الجنسـيــــــــــة:'),
                      customInputData('تاريخ الميـــــلاد:'),
                      customInputData('محل الميــــــلاد:'),
                      customInputData('الرقم القومـــــي:'),
                      customInputData('العنـــــــــــــوان:'),
                      customInputData('التليفون الأرضي:'),
                      customInputData('المحمــــــــــول:'),
                      customInputData('البريد الإلكتروني:'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.save,
                            size: 30.0,
                          ),
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
