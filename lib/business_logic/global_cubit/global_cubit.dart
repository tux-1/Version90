import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> types = [
    'طالب',
    'أستاذ جامعي',
    'إداري',
  ];
  int selectedTypeValue = 0;

  Future<void> loginUser(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(LoginLoading());

    try {
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(LoginSuccess(user.user!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password provided for that user.'));
      } else {
        emit(LoginFailure('There was an error!'));
      }
    } catch (e) {
      emit(LoginFailure('There was an error!'));
    }
  }

  void changeTypeSelection(int value) {
    selectedTypeValue = value;
    print('Selected Type Changed: $selectedTypeValue');
    emit(GlobalChangeSelectedType());
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
