import 'dart:ui';

import 'package:faculty_project/business_logic/admin_cubit/admin_cubit.dart';
import 'package:faculty_project/business_logic/admin_cubit/admin_state.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:faculty_project/presentation/widget/custom_row_gadwal.dart';
import 'package:faculty_project/presentation/widget/notfication_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCreateGadwal extends StatelessWidget {
  const AdminCreateGadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdminCubit(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (BuildContext context, AdminState state) {},
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    customBanner('إنشاء جدول المحاضرات'),
                    const SizedBox(height: 20),
                    Container(
                      height: 1.0,
                      color: AppColor.grey,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Wrap(
                        spacing: 90.0,
                        runSpacing: 20.0,
                        children: adminCubit.types
                            .map(
                              (e) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform.scale(
                                    scale: 1,
                                    child: SizedBox(
                                      height: 20.0,
                                      width: 20.0,
                                      child: Radio(
                                        activeColor: AppColor.black,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                            return AppColor.black;
                                          },
                                        ),
                                        value: adminCubit.types.indexOf(e),
                                        groupValue:
                                            adminCubit.selectedTypeValue,
                                        onChanged: (value) {
                                          adminCubit
                                              .changeTypeSelection(value!);
                                          print(value);
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    e.toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Colors
                                          .black, // Changed from Colors.white to Colors.black
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    customRowGadwal(context,'الفترة الأولى:'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    customRowGadwal(context,'الفترة الثانية:'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    customRowGadwal(context,'الفترة الثالثة:'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    customRowGadwal(context,'الفترة الرابعة:'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    customRowGadwal(context,'الفترة الخامسة:'),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: notificationScreenButtons(
                        txt1: 'حفظ',
                        txt2: 'إفراغ',
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/6,),
                    customRowButton(context: context, padding: 0.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
