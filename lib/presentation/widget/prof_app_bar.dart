
import 'package:faculty_project/business_logic/prof_cubit/prof_cubit.dart';
import 'package:faculty_project/business_logic/prof_cubit/prof_state.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_app_bar.dart';

class ProfAppBar extends StatelessWidget {
  const ProfAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfCubit, ProfState>(builder: (context, state) {
      final profCubit = context.read<ProfCubit>();
      return CustomAppBar(
        appBarWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            color: AppColor.babyBlue,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColor.carosalBG,
                    foregroundImage: profCubit.professor?.imageUrl == null
                        ? null
                        : NetworkImage(profCubit.professor!.imageUrl!),
                    child: const Icon(
                      Icons.person_outline,
                    ),
                  ),
                ),
                const Spacer(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('الاسم: ${profCubit.professor?.name ?? ''}'),
                      Text('الكود: ${profCubit.professor?.code ?? ''}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
