import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:faculty_project/presentation/widget/default_form_field.dart';
import 'package:faculty_project/presentation/widget/student_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/app_localization.dart';
import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../business_logic/student_cubit/student_cubit.dart';
import '../../../generated/assets.dart';
import '../../../constants/screens.dart';
import '../../styles/colors.dart';
import '../../styles/texts.dart';
import '../../widget/back_button.dart';
import '../../widget/custom_elevation.dart';
import '../../widget/dynamic_form_field.dart';

class StudentModargatScreen extends StatelessWidget {
  const StudentModargatScreen({Key? key}) : super(key: key);

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
              appBar: const CustomAppBar(
                appBarWidget: StudentAppBar(),
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
                                'مخطط المدرجات',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'رقم المدرج:',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              underline: Container(
                                color: AppColor.indigoDye,
                                height: 10.0,
                              ),
                              isExpanded: false,
                              // hint: const Text(
                              //   'اختر النوع',
                              //   style: TextStyle(
                              //     color: AppColor.babyBlue,
                              //     fontSize: 18,
                              //     fontFamily: 'cairo',
                              //     fontWeight:
                              //     FontWeight.w700,
                              //   ),
                              // ),
                              items: studentCubit.modargatList
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyles
                                                  .registerGenderListItemStyle,
                                            ),
                                          ))
                                  .toList(),
                              value: studentCubit.selectedModarag ?? '',
                              onChanged: (String? value) {
                                studentCubit.selectedModarag = value!;
                                studentCubit.changeSelectedModarag(value);
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
                            height: MediaQuery.of(context).size.height * 0.6,
                          ),
                          customRowButton(padding: 0.0, context: context),
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
