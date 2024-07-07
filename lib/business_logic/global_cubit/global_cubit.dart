import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  List<String> types = [
    'طالب',
    'أستاذ جامعي',
    'إداري',
  ];
  int selectedTypeValue=0;

  void changeTypeSelection(int value){
    selectedTypeValue =value;
    emit(GlobalChangeSelectedType());
  }

  // String? selectedOption;
  // void _handleRadioValueChange(String? value) {
  //   selectedOption = value;
  //   emit(GlobalChangeSelectedType());
  // }

}
