part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class IsObscureText extends LoginState {
  final bool isObscureText;

  IsObscureText({required this.isObscureText});
}
