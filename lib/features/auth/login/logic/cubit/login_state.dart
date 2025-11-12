part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class IsObscureText extends LoginState {
  final bool isObscureText;

  IsObscureText({required this.isObscureText});
}

////
final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String successString;

  LoginSuccess({required this.successString});
}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

////
final class SignInGoogleLoading extends LoginState {}

final class SignInGoogleSuccess extends LoginState {
  final String successString;

  SignInGoogleSuccess({required this.successString});
}

final class SignInGoogleFailure extends LoginState {
  final String message;
  SignInGoogleFailure({required this.message});
}
