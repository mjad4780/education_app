import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscureText = true;
  isObscureTextPassword() {
    emit(IsObscureText(isObscureText: isObscureText = !isObscureText));
  }

  emitLoginState() {
    if (formkey.currentState!.validate()) {
    } else {}
  }
  //   chooseimagegaler() async {
  //   file = await imageuploadgallery();
  //   if (file != null) {
  //     emit(const CategoriesState.galer());
  //   }
  // }
}
