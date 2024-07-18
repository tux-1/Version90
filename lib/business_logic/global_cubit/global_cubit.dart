import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faculty_project/model/account_type.dart';
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
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final accountDataDocSnapshot = await FirebaseFirestore.instance
          .collection('/accounts-types')
          .doc(user.user?.uid)
          .get();
      // print(accountDataDocSnapshot);
      final accountTypeString = accountDataDocSnapshot.data()?['account_type'];
      // print(accountTypeString);
      final accountType = AccountType.values.firstWhere(
        (e) => e.name == accountTypeString,
      );

      emit(LoginSuccess(user.user!, accountType));
    } on FirebaseAuthException catch (e) {
      FirebaseAuth.instance.signOut();
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password provided for that user.'));
      } else {
        print(e);
        emit(LoginFailure('There was an error!'));
      }
    } catch (e) {
      print(e);
      FirebaseAuth.instance.signOut();
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
