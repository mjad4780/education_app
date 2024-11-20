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
