import 'package:faculty_project/presentation/screens/admin/admin_create_gadwal.dart';
import 'package:faculty_project/presentation/screens/admin/admin_new_registration.dart';
import 'package:faculty_project/presentation/screens/admin/admin_prof_screens/admin_prof_degree.dart';
import 'package:faculty_project/presentation/screens/admin/admin_prof_screens/admin_prof_detail_screen.dart';
import 'package:faculty_project/presentation/screens/admin/admin_prof_screens/admin_prof_notification.dart';
import 'package:faculty_project/presentation/screens/admin/admin_prof_screens/admin_prof_subjects.dart';
import 'package:faculty_project/presentation/screens/admin/admin_student_screens/academic_registration_data_screen.dart';
import 'package:faculty_project/presentation/screens/admin/admin_data.dart';
import 'package:faculty_project/presentation/screens/admin/admin_home.dart';
import 'package:faculty_project/presentation/screens/admin/admin_student_screens/admin_notification_screen.dart';
import 'package:faculty_project/presentation/screens/admin/admin_prof_screens/admin_professor.dart';
import 'package:faculty_project/presentation/screens/admin/admin_student_screens/admin_student.dart';
import 'package:faculty_project/presentation/screens/admin/admin_student_screens/admin_student_detail_screen.dart';
import 'package:faculty_project/presentation/screens/admin/admin_student_screens/grade_report_screen.dart';
import 'package:faculty_project/presentation/screens/admin/admin_students_group.dart';
import 'package:faculty_project/presentation/screens/admin/new_registration/add_accounts.dart';
import 'package:faculty_project/presentation/screens/admin/new_registration/adminstrator.dart';
import 'package:faculty_project/presentation/screens/admin/new_registration/professor.dart';
import 'package:faculty_project/presentation/screens/admin/new_registration/student.dart';
import 'package:faculty_project/presentation/screens/admin/new_registration/student_affairs.dart';
import 'package:faculty_project/presentation/screens/admin/send_notfication.dart';
import 'package:faculty_project/presentation/screens/professor/prof_access.dart';
import 'package:faculty_project/presentation/screens/professor/prof_data.dart';
import 'package:faculty_project/presentation/screens/professor/prof_notifications.dart';
import 'package:faculty_project/presentation/screens/professor/prof_students_list.dart';
import 'package:faculty_project/presentation/screens/professor/prof_table.dart';
import 'package:faculty_project/presentation/screens/professor/prof_upload_subjects.dart';
import 'package:faculty_project/presentation/screens/student/password_change.dart';
import 'package:faculty_project/presentation/screens/student/student_academic.dart';
import 'package:faculty_project/presentation/screens/student/student_home.dart';
import 'package:faculty_project/presentation/screens/student/student_access.dart';
import 'package:flutter/material.dart';
import '../screens/login/login_screen.dart';
import '../screens/shared/splash_screen.dart';
import '../../constants/screens.dart';
import '../screens/student/personal_data.dart';
import '../screens/student/student_modargat.dart';
import '../screens/student/student_notification.dart';
import '../screens/student/student_quezes.dart';
import '../screens/student/student_subjects.dart';
import '../screens/student/student_table.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Screens.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Screens.studentHomeScreen:
        return MaterialPageRoute(builder: (_) => const StudentHomeScreen());
      case Screens.studentDataScreen:
        return MaterialPageRoute(builder: (_) => const StudentDataScreen());
      case Screens.studentTableScreen:
        return MaterialPageRoute(builder: (_) => const StudentTableScreen());
      case Screens.studentAccessScreen:
        return MaterialPageRoute(builder: (_) => const StudentAccessScreen());
      case Screens.studentModargatScreen:
        return MaterialPageRoute(builder: (_) => const StudentModargatScreen());
      case Screens.studentSubjectsScreen:
        return MaterialPageRoute(builder: (_) => const StudentSubjectsScreen());
      case Screens.studentQuesScreen:
        return MaterialPageRoute(builder: (_) => const StudentQuesScreen());
      case Screens.studentNotificationScreen:
        return MaterialPageRoute(
            builder: (_) => const StudentNotificationScreen());
      case Screens.profDataScreen:
        return MaterialPageRoute(builder: (_) => const ProfDataScreen());
      case Screens.profTableScreen:
        return MaterialPageRoute(builder: (_) => const ProfTableScreen());
      case Screens.profAccessScreen:
        return MaterialPageRoute(builder: (_) => const ProfAccessScreen());
      case Screens.profUploadSubjectsScreen:
        return MaterialPageRoute(builder: (_) => const ProfUploadSubjectsScreen());
      case Screens.profStudentsListScreen:
        return MaterialPageRoute(builder: (_) => const ProfStudentListScreen());
      case Screens.profNotificationsScreen:
        return MaterialPageRoute(builder: (_) => const ProfNotificationScreen());
      case Screens.passwordChangeScreen:
        return MaterialPageRoute(builder: (_) => const PasswordChangeScreen());
      case Screens.studentAcademicScreen:
        return MaterialPageRoute(builder: (_) => const StudentAcademicScreen());
      case Screens.adminHomeScreen:
        return MaterialPageRoute(builder: (_) => const AdminHomeScreen());
      case Screens.adminDataScreen:
        return MaterialPageRoute(builder: (_) => const AdminDataScreen());
      case Screens.adminStudentScreen:
        return MaterialPageRoute(builder: (_) => const AdminStudentScreen());
      case Screens.adminStudentDetailScreen:
        return MaterialPageRoute(builder: (_) => const StudentDetailScreen());
      case Screens.academicRegistrationDataScreen:
        return MaterialPageRoute(builder: (_) => const AcademicRegistrationDataScreen());
      case Screens.gradeReportScreen:
        return MaterialPageRoute(builder: (_) => const GradeReportScreen());
      case Screens.adminNotificationScreen:
        return MaterialPageRoute(builder: (_) => const AdminNotificationScreen());
      case Screens.adminProfessorScreen:
        return MaterialPageRoute(builder: (_) => const AdminProfessorScreen());
      case Screens.adminProfessorDetailScreen:
        return MaterialPageRoute(builder: (_) => const ProfessorDetailScreen());
      case Screens.adminProfessorNotificationScreen:
        return MaterialPageRoute(builder: (_) => const AdminProfessorNotificationScreen());
      case Screens.adminProfessorSubjectsScreen:
        return MaterialPageRoute(builder: (_) => const AdminProfessorSubjectsScreen());
      case Screens.adminProfessorDegreeScreen:
        return MaterialPageRoute(builder: (_) => const AdminProfessorDegreeScreen());
      case Screens.adminCreateGadwal:
        return MaterialPageRoute(builder: (_) => const AdminCreateGadwal());
      case Screens.adminStudentGroup:
        return MaterialPageRoute(builder: (_) => const AdminStudentGroup());
      case Screens.notificationSend:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Screens.adminNewRegistration:
        return MaterialPageRoute(builder: (_) => const AdminNewRegistration());
      case Screens.studentForm:
        return MaterialPageRoute(builder: (_) => StudentForm());
      case Screens.professorForm:
        return MaterialPageRoute(builder: (_) => const ProfessorForm());
      case Screens.adminstratorForm:
        return MaterialPageRoute(builder: (_) => const AdminstratorForm());
      case Screens.studentAffairsForm:
        return MaterialPageRoute(builder: (_) => const StudentAffairsForm());
      case Screens.addAccounts:
        return MaterialPageRoute(builder: (_) => const AddAccounts());
      default:
        return null;
    }
  }
}
