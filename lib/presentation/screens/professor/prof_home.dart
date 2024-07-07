import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_item_container.dart';
import 'package:faculty_project/presentation/widget/custom_row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/prof_cubit/prof_cubit.dart';
import '../../../business_logic/prof_cubit/prof_state.dart';
import '../../../constants/screens.dart';
import '../../widget/custom_app_bar.dart';

class ProfHomeScreen extends StatelessWidget {
  const ProfHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfCubit(),
      child: BlocConsumer<ProfCubit, ProfState>(
        listener: (BuildContext context, ProfState state) {},
        builder: (BuildContext context, ProfState state) {
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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      customItemContainer(
                          context: context,
                          txt: 'البيانات الشخصية',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.profDataScreen);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customItemContainer(
                          context: context,
                          txt: 'جدول المحاضرات',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.profTableScreen);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customItemContainer(
                          context: context,
                          txt: 'تسجيل الحضور الطلبه',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.profAccessScreen);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Screens.profUploadSubjectsScreen,
                            );
                          },
                          minWidth: 224.0,
                          child: const Center(
                            child: Text(
                              'رفع المقررات',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customItemContainer(
                          context: context,
                          txt: 'كشف الطلبة',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.profStudentsListScreen);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customItemContainer(
                          context: context,
                          txt: 'الإشعارات',
                          function: () {
                            Navigator.pushNamed(
                                context, Screens.profNotificationsScreen);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      customRowButton(padding: 200, context: context),
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
