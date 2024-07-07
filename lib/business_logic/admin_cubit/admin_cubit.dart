import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  List<String> types = [
    'السبت',
    'الأحد',
    'الإثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
  ];
  int selectedTypeValue = 0;
  bool isCodeSelected = true;

  void changeTypeSelection(int value) {
    selectedTypeValue = value;
    emit(GlobalChangeSelectedType());
  }

  void toggleSelection(bool value) {
    isCodeSelected = value;
    emit(GlobalChangeSelectedType()); // Update state to reflect the change
  }

  List<String> subjectsList = [
    'اختر....',
    'مادة 1',
    'مادة 2',
    'مادة 3',
  ];
  String selectedSubjects = 'اختر....';

  void changeSelectedSubject(String value) {
    selectedSubjects = value;
    emit(GlobalChangeSelectedType());
  }
}
