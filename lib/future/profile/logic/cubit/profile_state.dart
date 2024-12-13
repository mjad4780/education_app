part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class IsObscureText extends ProfileState {
  final bool isObscureText;

  IsObscureText({required this.isObscureText});
}

final class ProfileImageSignUp extends ProfileState {
  final File profileImage;

  ProfileImageSignUp({required this.profileImage});
}

////
final class SignupLoading extends ProfileState {}

final class SignupSuccess extends ProfileState {
  final String successString;

  SignupSuccess({required this.successString});
}

final class SignupFailure extends ProfileState {
  final String message;
  SignupFailure({required this.message});
}
