import 'package:firebase_auth/firebase_auth.dart';

abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class PasswordVisibilityToggled extends RegistrationState {
  final bool isPasswordVisible;
  PasswordVisibilityToggled(this.isPasswordVisible);
}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final User user;
  RegistrationSuccess(this.user);
}

class RegistrationFailure extends RegistrationState {
  final String error;
  RegistrationFailure(this.error);
}
