part of 'student_cubit.dart';

@immutable
sealed class StudentState {}

final class StudentInitial extends StudentState {}

final class StudentLoading extends StudentState {}

final class StudentDataLoaded extends StudentState {
  final Map<String, dynamic> studentData;

  StudentDataLoaded(this.studentData);
}

final class StudentDataError extends StudentState {
  final String error;

  StudentDataError(this.error);
}

final class GlobalChangeSelectedType extends StudentState {}
