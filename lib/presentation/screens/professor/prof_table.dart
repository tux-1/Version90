import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/prof_cubit/prof_cubit.dart';
import '../../../business_logic/prof_cubit/prof_state.dart';
import '../../../constants/screens.dart';
import '../../styles/colors.dart';
import '../../widget/back_button.dart';

class ProfTableScreen extends StatelessWidget {
  const ProfTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfCubit(),
      child: BlocConsumer<ProfCubit, ProfState>(
        listener: (context, state) async {},
        builder: (context, state) {
          return Builder(builder: (context) {
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
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: AppColor.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Center(
                              child: Text(
                                'الجدول الدراسي',
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
                          Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:double.infinity,
                                    decoration: const BoxDecoration(
                                      color: AppColor.carosalBG,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration: const BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('السبت'),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('الأحد'),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('الإثنين'),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('الثلاثاء'),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('الأربعاء'),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('الخميس'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('الأولى'),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('الثانية'),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('الثالثة'),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('الرابعة'),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.tableActiveCell,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text('الخامسة'),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration:  BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                         customRowButton(padding: 0.0,context: context),
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
