import '../../model/adminstrator_model.dart';
import '../../model/affiars_model.dart';
import '../../model/professor_model.dart';
import '../../model/student_model.dart';

abstract class AdminState {}

class AdminInitial extends AdminState {}

class GlobalChangeSelectedType extends AdminState {}

// States for Student
class AdminStudentAdded extends AdminState {
  final List<Student> students;
  AdminStudentAdded(this.students);
}

class AdminStudentAddError extends AdminState {
  final String error;
  AdminStudentAddError(this.error);
}

// States for Administrator
class AdminAdministratorAdded extends AdminState {
  final List<Administrator> administrators;
  AdminAdministratorAdded(this.administrators);
}

class AdminAdministratorAddError extends AdminState {
  final String error;
  AdminAdministratorAddError(this.error);
}

// States for Professor
class AdminProfessorAdded extends AdminState {
  final List<Professor> professors;
  AdminProfessorAdded(this.professors);
}

class AdminProfessorAddError extends AdminState {
  final String error;
  AdminProfessorAddError(this.error);
}

// States for Affairs
class AdminAffairsAdded extends AdminState {
  final List<Affairs> affairs;
  AdminAffairsAdded(this.affairs);
}

class AdminAffairsAddError extends AdminState {
  final String error;
  AdminAffairsAddError(this.error);
}

// States for Saving Schedule
class AdminSaveScheduleLoading extends AdminState {}

class AdminSaveScheduleSuccess extends AdminState {}

class AdminSaveScheduleError extends AdminState {
  final String error;
  AdminSaveScheduleError(this.error);
}
