part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class IsObscureText extends SignUpState {
  final bool isObscureText;

  IsObscureText({required this.isObscureText});
}

final class ProfileImageSignUp extends SignUpState {
  final File profileImage;

  ProfileImageSignUp({required this.profileImage});
}

////
final class SignupLoading extends SignUpState {}

final class SignupSuccess extends SignUpState {
  final String successString;

  SignupSuccess({required this.successString});
}

final class SignupFailure extends SignUpState {
  final String message;
  SignupFailure({required this.message});
}
