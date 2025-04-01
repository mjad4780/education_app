import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscureText = true;
  final LoginRepo loginRepo;
  isObscureTextPassword() {
    emit(IsObscureText(isObscureText: isObscureText = !isObscureText));
  }

  Future<void> login() async {
    if (!formkey.currentState!.validate()) return;

    emit(LoginLoading());
    final result = await loginRepo.login(
      email.text,
      password.text,
    );
    result.fold(
      (failure) => emit(
        LoginFailure(message: failure.message),
      ),
      (success) => emit(
        LoginSuccess(successString: success),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInGoogleLoading());
    final result = await loginRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(
        SignInGoogleFailure(message: failure.message),
      ),
      (success) => emit(
        SignInGoogleSuccess(successString: success),
      ),
    );
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
