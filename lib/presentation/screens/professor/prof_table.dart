import 'package:faculty_project/constants/empty_schedule.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/prof_cubit/prof_cubit.dart';
import '../../../business_logic/prof_cubit/prof_state.dart';
import '../../styles/colors.dart';
import '../../widget/prof_app_bar.dart';

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
            Map<String, dynamic> schedule = emptyScheduleJson;
            if (state is ProfTableLoaded) {
              schedule = state.tableData;
            }
            return Scaffold(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
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
                                                  color:
                                                      AppColor.tableActiveCell,
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              for (final day
                                                  in schedule['days'])
                                                Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  width: 80.0,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.cardGray,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        day['periods'][0]
                                                            ['teacher'],
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                      Text(
                                                        day['periods'][0]
                                                            ['subject'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              for (final day
                                                  in schedule['days'])
                                                Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  width: 80.0,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.cardGray,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        day['periods'][1]
                                                            ['teacher'],
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                      Text(
                                                        day['periods'][1]
                                                            ['subject'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              for (final day
                                                  in schedule['days'])
                                                Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  width: 80.0,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.cardGray,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        day['periods'][2]
                                                            ['teacher'],
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                      Text(
                                                        day['periods'][2]
                                                            ['subject'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              for (final day
                                                  in schedule['days'])
                                                Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  width: 80.0,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.cardGray,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        day['periods'][3]
                                                            ['teacher'],
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                      Text(
                                                        day['periods'][3]
                                                            ['subject'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.tableActiveCell,
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
                                                decoration: BoxDecoration(
                                                  color: AppColor.cardGray,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              for (final day
                                                  in schedule['days'])
                                                Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  width: 80.0,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.cardGray,
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        day['periods'][4]
                                                            ['teacher'],
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                      Text(
                                                        day['periods'][4]
                                                            ['subject'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      )
                                                    ],
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
