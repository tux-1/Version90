import 'package:faculty_project/presentation/screens/admin/admin_home.dart';
import 'package:faculty_project/presentation/screens/professor/prof_home.dart';
import 'package:faculty_project/presentation/screens/student/student_home.dart';
import 'package:faculty_project/presentation/widget/default_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../generated/assets.dart';
import '../../styles/colors.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) async {},
        builder: (context, state) {
          return Builder(builder: (context) {
            final GlobalCubit globalCubit = context.read<GlobalCubit>();
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 29,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.imagesHomeImage,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.05,
                          child: const Image(
                            image: AssetImage(
                              Assets.imagesIcon1,
                            ),
                            height: 113.0,
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.05,
                          right: MediaQuery.of(context).size.width * 0.05,
                          child: const Image(
                            image: AssetImage(Assets.imagesIcon2),
                            height: 113.0,
                          ),
                        ),
                        Positioned(
                          top: (MediaQuery.of(context).size.height - 267.0) / 2,
                          right:
                          (MediaQuery.of(context).size.width - 282.0) / 2,
                          child: Container(
                            constraints: const BoxConstraints(
                              minHeight: 267.0,
                              minWidth: 282.0,
                            ),
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: AppColor.redContainer,
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'اسم المستخدم :',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.40,
                                          height: 55.0,
                                          child: defaultFormField(
                                            controller:
                                            globalCubit.emailController,
                                            type: TextInputType.emailAddress,
                                            borderRadius: 10.0,
                                            isPrefixText: false,
                                            decoratedColor: AppColor.white,
                                            inputColor: AppColor.white,
                                            disabledColor: AppColor.white,
                                            textColor: AppColor.white,
                                            onSubmit: (_) {},
                                            onChange: (_) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'كلمة المرور :',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.40,
                                          height: 55.0,
                                          child: defaultFormField(
                                            controller:
                                            globalCubit.passwordController,
                                            type: TextInputType.visiblePassword,
                                            borderRadius: 10.0,
                                            isPrefixText: false,
                                            decoratedColor: AppColor.white,
                                            inputColor: AppColor.white,
                                            disabledColor: AppColor.white,
                                            textColor: AppColor.white,
                                            onSubmit: (_) {},
                                            onChange: (_) {},
                                            isPassword: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: globalCubit.types
                                          .map(
                                            (e) => Row(
                                          children: [
                                            Transform.scale(
                                              scale: 0.7,
                                              child: SizedBox(
                                                height: 20.0,
                                                width: 20.0,
                                                child: Radio(
                                                  activeColor:
                                                  AppColor.white,
                                                  fillColor:
                                                  MaterialStateProperty
                                                      .resolveWith<
                                                      Color>((Set<
                                                      MaterialState>
                                                  states) {
                                                    return AppColor.white;
                                                  }),
                                                  value: globalCubit.types
                                                      .indexOf(e),
                                                  groupValue: globalCubit
                                                      .selectedTypeValue,
                                                  onChanged: (value) {
                                                    globalCubit
                                                        .changeTypeSelection(
                                                        value!);
                                                    print(value);
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              e.toString(),
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                          .toList(),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.loginButton,
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (globalCubit.selectedTypeValue != null) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) {
                                                switch (globalCubit.types[globalCubit.selectedTypeValue!]) {
                                                  case 'طالب':
                                                    return StudentHomeScreen();
                                                  case 'أستاذ جامعي':
                                                    return ProfHomeScreen();
                                                  case 'اداري':
                                                    return AdminHomeScreen();
                                                  default:
                                                    return AdminHomeScreen();
                                                }
                                              }),
                                            );
                                          }
                                        },
                                        minWidth: 224.0,
                                        child: const Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'تسجيل الدخول',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Icon(Icons.login)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    const Text(
                                      "ليس لديك حساب؟ الرجاء التسجيل",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
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
