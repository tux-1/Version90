import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:faculty_project/business_logic/prof_cubit/prof_cubit.dart';
import 'package:faculty_project/business_logic/prof_cubit/prof_state.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/styles/texts.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/prof_app_bar.dart';

class ProfUploadSubjectsScreen extends StatelessWidget {
  const ProfUploadSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfCubit(),
      child: BlocConsumer<ProfCubit, ProfState>(
        listener: (context, state) {},
        builder: (context, state) {
          final ProfCubit profCubit = context.read<ProfCubit>();
          return  Scaffold(
            appBar: const  CustomAppBar(
                appBarWidget: ProfAppBar(),
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
                              'المقررات',
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
                                'المادة :',
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
                            items: profCubit.subjectsList
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
                            value: profCubit.selectedSubjects ,
                            onChanged: (String? value) {
                              profCubit.selectedSubjects = value!;
                              profCubit.changeSelectedSubject(value);
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
                        profCubit.selectedSubjects != 'اختر....'
                            ? Column(
                          children: [
                            Container(
                              height: 56.0,
                              decoration: BoxDecoration(
                                color: AppColor.grey,
                                borderRadius:
                                BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text(
                                  profCubit.selectedSubjects,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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
                                  Icon(
                                    Icons.folder,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'المحاضرات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                  Icon(
                                    Icons.folder,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'سكشن',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                  Icon(
                                    Icons.folder,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'نماذج الامتحانات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                  Icon(
                                    Icons.folder,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'حلول الامتحانات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                          ],
                        )
                            : const SizedBox(),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.25 ,
                        ),
                        customRowButton(padding: 25.0,context: context),
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
