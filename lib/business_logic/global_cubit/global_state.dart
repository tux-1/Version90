part of 'global_cubit.dart';

@immutable
sealed class GlobalState {}

final class GlobalInitial extends GlobalState {}

final class GlobalChangeSelectedType extends GlobalState {}

class LoginInitial extends GlobalState {}

class LoginLoading extends GlobalState {}

class LoginSuccess extends GlobalState {
  final User user;
  final AccountType accountType;
  LoginSuccess(this.user, this.accountType);
}

class LoginFailure extends GlobalState {
  final String error;
  LoginFailure(this.error);
}
