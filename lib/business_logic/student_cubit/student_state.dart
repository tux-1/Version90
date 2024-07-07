part of 'student_cubit.dart';

@immutable
sealed class StudentState {}

final class StudentInitial extends StudentState {}
final class GlobalChangeSelectedType extends StudentState {}
