import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());



  final oldpasswordcontroller = TextEditingController();
  final newpasswordcontroller = TextEditingController();
  final donepasswordcontroller = TextEditingController();


  List<String> modargatList = [
    'اختر....',
    'مدرج المرعشلي',
    'مدرج 1',
    'مدرج 2',
    'مدرج 3',
    'مدرج 510',
    'مدرج 22',
    'مدرج 26',
  ];
  String selectedModarag = 'اختر....';

  List<String> subjectsList = [
    'اختر....',
    'مادة 1',
    'مادة 2',
    'مادة 3',
  ];
  String selectedSubjects = 'اختر....';

  String selectacademicyear = 'اختر المستوي...';

  List<String> academicyearList = [
    'اختر....',
    'فرقه 0',
    'فرقه 1',
    'فرقه 2',
    'فرقه 3',
    'فرقه 4',
  ];

  void changeSelectedModarag(String value) {
    selectedModarag = value;
    emit(GlobalChangeSelectedType());
  }

  void changeSelectedSubject(String value) {
    selectedSubjects = value;
    emit(GlobalChangeSelectedType());
  }

  void changeSelectedAcademicYear(String value){
    selectacademicyear = value;
    emit(GlobalChangeSelectedType());
  }


}