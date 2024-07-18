import 'package:barcode_widget/barcode_widget.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:faculty_project/presentation/widget/default_form_field.dart';
import 'package:faculty_project/presentation/widget/student_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/student_cubit/student_cubit.dart';
import '../../../generated/assets.dart';
import '../../../constants/screens.dart';
import '../../styles/colors.dart';


class StudentAccessScreen extends StatelessWidget {
  const StudentAccessScreen({Key? key}) : super(key: key);

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
              appBar:CustomAppBar(
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
                                'تسجيل الحضور',
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
                          Container(
                            width: 270.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              color: AppColor.grey,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: const Image(
                              image: AssetImage(
                                Assets.imagesProfileImg,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: 270.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              color: AppColor.grey,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: 200.0,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: BarcodeWidget(
                                  data: 'test',
                                  barcode: Barcode.qrCode(),
                                  color: AppColor.indigoDye,
                                  width: 200,
                                  height: 200,
                                ),
                              ),
                            ),
                          ),
                         customRowButton(padding: 130.0,context: context),
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
