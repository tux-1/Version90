import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faculty_project/data/remote/firebase_helper.dart';
import 'package:faculty_project/model/student_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial()) {
    initData();
  }

  final oldpasswordcontroller = TextEditingController();
  final newpasswordcontroller = TextEditingController();
  final donepasswordcontroller = TextEditingController();
  // Map<String, dynamic> schedule = {};

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

  Student? studentData;

  Future<void> initData() async {
    await getSchedule();
    await getStudentData();
  }

  Future<void> getStudentData() async {
    try {
      emit(StudentLoading());
      final userDataDoc = await FirebaseFirestore.instance
          .collection('students')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      print(userDataDoc.data());
      studentData = Student.fromJson(userDataDoc.data()!);

      emit(StudentLoadingFinished());
    } catch (e) {
      emit(StudentDataError(e.toString()));
    }
  }

  Future<void> getSchedule() async {
    try {
      emit(StudentLoading());
      final schedule = await FirebaseHelper.getSchedule();
      emit(StudentDataLoaded(schedule));
    } catch (e) {
      emit(StudentDataError(e.toString()));
    }
  }

  void changeSelectedModarag(String value) {
    selectedModarag = value;
    emit(GlobalChangeSelectedType());
  }

  void changeSelectedSubject(String value) {
    selectedSubjects = value;
    emit(GlobalChangeSelectedType());
  }

  void changeSelectedAcademicYear(String value) {
    selectacademicyear = value;
    emit(GlobalChangeSelectedType());
  }
}
