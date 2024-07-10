import 'package:faculty_project/business_logic/prof_cubit/prof_state.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:faculty_project/presentation/widget/custom_user_data_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/prof_cubit/prof_cubit.dart';
import '../../styles/colors.dart';

class ProfDataScreen extends StatelessWidget {
  const ProfDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfCubit(),
      child: BlocConsumer<ProfCubit, ProfState>(
        listener: (context, ProfState state) async {},
        builder: (context, ProfState state) {
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
                          Column(
                            children: [
                              Container(
                                height: 35.0,
                                color: AppColor.grey,
                                child: const Center(
                                  child: Text(
                                    'البيانات الشخصية',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: AppColor.carosalBG,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Column(
                                      children: [
                                        customUserDataItem(
                                          context: context,
                                          txt: 'الاســــــــــم:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        customUserDataItem(
                                          context: context,
                                          txt: 'الكـــــــــــود:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        customUserDataItem(
                                          context: context,
                                          txt: 'الديـــــــــانة:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        customUserDataItem(
                                          context: context,
                                          txt: 'الجــــنــــس:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        customUserDataItem(
                                          context: context,
                                          txt: 'الجــنـســـية:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        customUserDataItem(
                                            context: context,
                                            txt: 'تاريخ الميـلاد:', data: ''),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        customUserDataItem(
                                          context: context,
                                          txt: 'محل الميـلاد:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        customUserDataItem(
                                          context: context,
                                          txt: 'الرقم القومي:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 7.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 35.0,
                                color: AppColor.grey,
                                child: const Center(
                                  child: Text(
                                    'بيانات الاتصال',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: AppColor.carosalBG,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Column(
                                      children: [
                                        customUserDataItem(
                                          context: context,
                                          txt: 'العنـــــــــــــوان:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        customUserDataItem(
                                          context: context,
                                          txt: 'التليفون الأرضي:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        customUserDataItem(
                                          context: context,
                                          txt: 'المحمـــــــــــول:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        customUserDataItem(
                                          context: context,
                                          txt: 'البريد الإلكـتروني:', data: '',
                                        ),
                                        const SizedBox(
                                          height: 7.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          customRowButton(padding: 50.0, context: context),
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
