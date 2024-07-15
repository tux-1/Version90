import 'package:faculty_project/business_logic/student_cubit/student_cubit.dart';
import 'package:faculty_project/presentation/screens/student/selected_choice_screen.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/styles/texts.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class StudentAcademicScreen extends StatelessWidget {
  const StudentAcademicScreen({super.key});

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
                              'التسجيل الاكاديمي',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            underline: Container(
                              color: AppColor.indigoDye,
                              height: 10.0,
                            ),
                            isExpanded: false,
                            items: studentCubit.academicyearList
                                .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyles
                                    .registerGenderListItemStyle,
                              ),
                            ))
                                .toList(),
                            value: studentCubit.selectedModarag,
                            onChanged: (String? value) {
                              if (value != null) {
                                studentCubit.changeSelectedModarag(value);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectedChoiceScreen(
                                      selectedChoice: value,
                                    ),
                                  ),
                                );
                              }
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.symmetric(
                                horizontal: 40.0,
                              ),
                              height: 40,
                              width: double.infinity,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.66,
                        ),
                        customRowButton(padding: 0.0, context: context),
                      ],
                    ),
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
