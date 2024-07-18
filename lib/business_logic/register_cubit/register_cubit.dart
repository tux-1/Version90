import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faculty_project/business_logic/register_cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityToggled(isPasswordVisible));
  }

  

  Future<void> registerUser(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(RegistrationLoading());

    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(RegistrationSuccess(user.user!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegistrationFailure('Weak Password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegistrationFailure('Email already Exists'));
      } else {
        emit(RegistrationFailure('There was an error!'));
      }
    } catch (e) {
      emit(RegistrationFailure('There was an error!'));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    return super.close();
  }
}
