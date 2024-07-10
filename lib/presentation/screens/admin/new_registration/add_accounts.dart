import 'package:faculty_project/business_logic/register_cubit/register_state.dart';
import 'package:faculty_project/constants/screens.dart';
import 'package:faculty_project/constants/validator.dart';
import 'package:faculty_project/presentation/styles/colors.dart';
import 'package:faculty_project/presentation/widget/custom_app_bar.dart';
import 'package:faculty_project/presentation/widget/custom_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../business_logic/register_cubit/register_cubit.dart';

class AddAccounts extends StatelessWidget {
  const AddAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: const AddAccountsForm(),
    );
  }
}

class AddAccountsForm extends StatelessWidget {
  const AddAccountsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is RegistrationSuccess) {
          Navigator.pushNamed(context, Screens.loginScreen, arguments: state.user.email);
        }
      },
      builder: (context, state) {
        final cubit = context.read<RegistrationCubit>();
        return ModalProgressHUD(
          inAsyncCall: state is RegistrationLoading,
          child: Scaffold(
            appBar: CustomAppBar(
              appBarWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  color: AppColor.babyBlue,
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: CircleAvatar(
                          backgroundColor: AppColor.carosalBG,
                          child: Icon(Icons.person_outline),
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
            body: Form(
              key: cubit.formKey,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 20.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: [
                          Center(
                            child: customBanner('اضافه حساب'),
                          ),
                          const SizedBox(height: 15.0),
                          TextFormField(
                            controller: cubit.emailController,
                            focusNode: cubit.emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email_outlined),
                              labelText: 'البريد الالكتروني',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            validator: MyValidators.emailValidator,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(cubit.passwordFocusNode);
                            },
                          ),
                          const SizedBox(height: 15.0),
                          TextFormField(
                            controller: cubit.passwordController,
                            focusNode: cubit.passwordFocusNode,
                            obscureText: cubit.isPasswordVisible,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.togglePasswordVisibility();
                                },
                                icon: Icon(
                                  cubit.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                ),
                              ),
                              labelText: 'كلمة المرور',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            validator: MyValidators.passwordValidator,
                          ),
                          const SizedBox(height: 15.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.loginButton,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                cubit.registerUser(context);
                              },
                              icon: const Icon(
                                Icons.verified_user,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
