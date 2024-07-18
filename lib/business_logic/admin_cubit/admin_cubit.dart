import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/adminstrator_model.dart';
import '../../model/affiars_model.dart';
import '../../model/professor_model.dart';
import '../../model/student_model.dart';
import 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Controllers for form fields
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController studentCodeController = TextEditingController();
  final TextEditingController studentReligionController =
      TextEditingController();
  final TextEditingController studentGenderController = TextEditingController();
  final TextEditingController studentNationalityController =
      TextEditingController();
  final TextEditingController studentBirthDateController =
      TextEditingController();
  final TextEditingController studentBirthPlaceController =
      TextEditingController();
  final TextEditingController studentNationalIdController =
      TextEditingController();
  final TextEditingController studentAddressController =
      TextEditingController();
  final TextEditingController studentLandlineController =
      TextEditingController();
  final TextEditingController studentMobileController = TextEditingController();
  final TextEditingController studentEmailController = TextEditingController();

  // Controllers for administrator form fields
  final TextEditingController adminNameController = TextEditingController();
  final TextEditingController adminCodeController = TextEditingController();
  final TextEditingController adminReligionController = TextEditingController();
  final TextEditingController adminGenderController = TextEditingController();
  final TextEditingController adminNationalityController =
      TextEditingController();
  final TextEditingController adminBirthDateController =
      TextEditingController();
  final TextEditingController adminBirthPlaceController =
      TextEditingController();
  final TextEditingController adminNationalIdController =
      TextEditingController();
  final TextEditingController adminAddressController = TextEditingController();
  final TextEditingController adminLandlineController = TextEditingController();
  final TextEditingController adminMobileController = TextEditingController();
  final TextEditingController adminEmailController = TextEditingController();

  // Controllers for professor form fields
  final TextEditingController professorNameController = TextEditingController();
  final TextEditingController professorCodeController = TextEditingController();
  final TextEditingController professorReligionController =
      TextEditingController();
  final TextEditingController professorGenderController =
      TextEditingController();
  final TextEditingController professorNationalityController =
      TextEditingController();
  final TextEditingController professorBirthDateController =
      TextEditingController();
  final TextEditingController professorBirthPlaceController =
      TextEditingController();
  final TextEditingController professorNationalIdController =
      TextEditingController();
  final TextEditingController professorAddressController =
      TextEditingController();
  final TextEditingController professorLandlineController =
      TextEditingController();
  final TextEditingController professorMobileController =
      TextEditingController();
  final TextEditingController professorEmailController =
      TextEditingController();

  // Controllers for affairs form fields
  final TextEditingController affairsNameController = TextEditingController();
  final TextEditingController affairsCodeController = TextEditingController();
  final TextEditingController affairsReligionController =
      TextEditingController();
  final TextEditingController affairsGenderController = TextEditingController();
  final TextEditingController affairsNationalityController =
      TextEditingController();
  final TextEditingController affairsBirthDateController =
      TextEditingController();
  final TextEditingController affairsBirthPlaceController =
      TextEditingController();
  final TextEditingController affairsNationalIdController =
      TextEditingController();
  final TextEditingController affairsAddressController =
      TextEditingController();
  final TextEditingController affairsLandlineController =
      TextEditingController();
  final TextEditingController affairsMobileController = TextEditingController();
  final TextEditingController affairsEmailController = TextEditingController();

  // For type selection and toggling
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
    emit(GlobalChangeSelectedType());
  }

  // For subject selection
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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var usernamefocusnode = FocusNode();
  var emailfocusnode = FocusNode();
  String? email;
  String? password;

  // Lists to store data
  List<Student> students = [];
  List<Administrator> administrators = [];
  List<Professor> professors = [];
  List<Affairs> affairs = [];

  void throwError(Object e) {
    emit(AdminStudentAddError(e.toString()));
  }

  Future<void> addStudent(Student student, String id) async {
    try {
      // تحويل الطالب إلى خريطة
      Map<String, dynamic> studentData = student.toMap();
      // إضافة البيانات إلى Firestore
      
      await _firestore.collection('students').doc(id).set(studentData);

      emit(AdminStudentAdded(students)); // يمكنك تحديث القائمة أو استبعادها
    } catch (e) {
      emit(AdminStudentAddError(e.toString()));
    }
  }

  void addAdministrator(Administrator administrator, String id) async {
    try {
      await _firestore.collection('administrators').doc(id).set(administrator.toJson());
      administrators.add(administrator);
      emit(AdminAdministratorAdded(administrators));
    } catch (e) {
      emit(AdminAdministratorAddError(e.toString()));
    }
  }

  void addProfessor(Professor professor, String id) async {
    try {
      await _firestore.collection('professors').doc(id).set(professor.toJson());
      professors.add(professor);
      emit(AdminProfessorAdded(professors));
    } catch (e) {
      emit(AdminProfessorAddError(e.toString()));
    }
  }

  void addAffairs(Affairs affair) {
    try {
      affairs.add(affair);
      emit(AdminAffairsAdded(affairs));
    } catch (e) {
      emit(AdminAffairsAddError(e.toString()));
    }
  }

  void clearStudentControllers() {
    studentNameController.clear();
    studentCodeController.clear();
    studentReligionController.clear();
    studentGenderController.clear();
    studentNationalityController.clear();
    studentBirthDateController.clear();
    studentBirthPlaceController.clear();
    studentNationalIdController.clear();
    studentAddressController.clear();
    studentLandlineController.clear();
    studentMobileController.clear();
    studentEmailController.clear();
  }

  void clearAdministratorControllers() {
    adminNameController.clear();
    adminCodeController.clear();
    adminReligionController.clear();
    adminGenderController.clear();
    adminNationalityController.clear();
    adminBirthDateController.clear();
    adminBirthPlaceController.clear();
    adminNationalIdController.clear();
    adminAddressController.clear();
    adminLandlineController.clear();
    adminMobileController.clear();
    adminEmailController.clear();
  }

  void clearProfessorControllers() {
    professorNameController.clear();
    professorCodeController.clear();
    professorReligionController.clear();
    professorGenderController.clear();
    professorNationalityController.clear();
    professorBirthDateController.clear();
    professorBirthPlaceController.clear();
    professorNationalIdController.clear();
    professorAddressController.clear();
    professorLandlineController.clear();
    professorMobileController.clear();
    professorEmailController.clear();
  }

  void clearAffairsControllers() {
    affairsNameController.clear();
    affairsCodeController.clear();
    affairsReligionController.clear();
    affairsGenderController.clear();
    affairsNationalityController.clear();
    affairsBirthDateController.clear();
    affairsBirthPlaceController.clear();
    affairsNationalIdController.clear();
    affairsAddressController.clear();
    affairsLandlineController.clear();
    affairsMobileController.clear();
    affairsEmailController.clear();
  }

  Future<void> saveSchedule(Map<String, dynamic> scheduleData) async {
    emit(AdminSaveScheduleLoading());
    try {
      await _firestore.collection('schedules').doc('gadwal').set(scheduleData);
      emit(AdminSaveScheduleSuccess());
    } catch (error) {
      emit(AdminSaveScheduleError(error.toString()));
    }
  }

  // Schedule data management
  Map<String, Map<int, Map<String, String>>> scheduleData = {};

  void setSubject(String day, int period, String subject) {
    if (!scheduleData.containsKey(day)) {
      scheduleData[day] = {};
    }
    if (!scheduleData[day]!.containsKey(period)) {
      scheduleData[day]![period] = {};
    }
    scheduleData[day]![period]!['subject'] = subject;
  }

  void setTeacher(String day, int period, String teacher) {
    if (scheduleData.containsKey(day) &&
        scheduleData[day]!.containsKey(period)) {
      scheduleData[day]![period]!['teacher'] = teacher;
    }
  }

  String getSubject(String day, int period) {
    return scheduleData[day]?[period]?['subject'] ?? '';
  }

  String getTeacher(String day, int period) {
    return scheduleData[day]?[period]?['teacher'] ?? '';
  }
}
