import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:faculty_project/business_logic/prof_cubit/prof_cubit.dart';
import 'package:faculty_project/business_logic/prof_cubit/prof_state.dart';
import 'package:faculty_project/constants/screens.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/back_button.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../styles/texts.dart';

class ProfStudentListScreen extends StatelessWidget {
  const ProfStudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfCubit(),
      child: BlocConsumer<ProfCubit, ProfState>(
        listener: (context, state) {},
        builder: (context, state) {
          final ProfCubit profCubit = context.read<ProfCubit>();
          return Scaffold(
            appBar: CustomAppBar(
              appBarWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  color: AppColor.babyBlue,
                  child: const Row(
                    children: [
                      BackButtonWidget(
                        direction: true,
                        buttonColor: AppColor.black,
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
            body: SafeArea(
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
                            'كشف الطلبه',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
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
                                      items: profCubit.subjectsList
                                          .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyles
                                                  .registerGenderListItemStyle,
                                            ),
                                          ))
                                          .toList(),
                                      value: profCubit.selectedSubjects,
                                      onChanged: (String? value) {
                                        profCubit.changeSelectedSubject(value!);
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 40.0,
                                        ),
                                        height: 40,
                                        width: double.infinity,
                                      ),
                                      menuItemStyleData:
                                      const MenuItemStyleData(
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                  if (profCubit.selectedSubjects != 'اختر....')
                                    Column(
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
                                        const SizedBox(height: 16.0),
                                        DataTable(
                                          columns: const [
                                            DataColumn(label: Text('اسم الطالب')),
                                            DataColumn(label: Text('الكود')),
                                            DataColumn(label: Text('ملاحظات')),
                                          ],
                                          rows: profCubit.studentsList
                                              .map(
                                                (student) => DataRow(
                                              cells: [
                                                DataCell(Text(student.name)),
                                                DataCell(Text(student.code)),
                                                DataCell(Text(student.notes)),
                                              ],
                                            ),
                                          ).toList(),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      customRowButton(padding: 200,context: context),
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
