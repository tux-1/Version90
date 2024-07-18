import 'package:bloc/bloc.dart';
import 'package:faculty_project/business_logic/prof_cubit/prof_state.dart';
import 'package:flutter/material.dart';

import '../../data/remote/firebase_helper.dart';

// Define a simple Student model
class Student {
  final String name;
  final String code;
  final String notes;

  Student({required this.name, required this.code, required this.notes});
}

class ProfCubit extends Cubit<ProfState> {
  ProfCubit() : super(ProfInitial()){
    getSchedule();
  }

  final namecontroller = TextEditingController();
  final codecontroller = TextEditingController();

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

  List<Student> studentsList = [];

  void changeSelectedModarag(String value) {
    selectedModarag = value;
    emit(GlobalChangeSelectedType());
  }

  void changeSelectedSubject(String value) {
    selectedSubjects = value;
    fetchStudentsForSubject(value);
    emit(GlobalChangeSelectedType());
  }

  void changeSelectedAcademicYear(String value) {
    selectacademicyear = value;
    emit(GlobalChangeSelectedType());
  }

  void getSchedule() async {
    try {
      emit(ProfLoadingState());
      final schedule = await FirebaseHelper.getSchedule();
      emit(ProfTableLoaded(schedule));
    } catch (e) {
      emit(ProfDataError(e.toString()));
    }
  }

  void fetchStudentsForSubject(String subject) {
    // This is just an example. Replace with your actual data fetching logic.
    if (subject == 'مادة 1') {
      studentsList = [
        Student(name: 'Student 1', code: '001', notes: 'Good'),
        Student(name: 'Student 2', code: '002', notes: 'Average'),
        Student(name: 'Student 3', code: '003', notes: 'Excellent'),
      ];
    } else if (subject == 'مادة 2') {
      studentsList = [
        Student(name: 'Student A', code: '004', notes: 'Good'),
        Student(name: 'Student B', code: '005', notes: 'Average'),
        Student(name: 'Student C', code: '006', notes: 'Excellent'),
      ];
    } else {
      studentsList = [];
    }
    emit(ProfStudentsFetched());
  }
}
