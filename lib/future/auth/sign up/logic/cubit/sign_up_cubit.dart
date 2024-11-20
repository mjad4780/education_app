import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/function/alert_dialog.dart';
import '../../../../../core/function/upload_image.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  AutovalidateMode autovalidateModeSignUp = AutovalidateMode.disabled;
  GlobalKey<FormState> formkeySignUp = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  String? gender;
  File? file;
  bool isObscureText = true;
  isObscureTextPassword() {
    emit(IsObscureText(isObscureText: isObscureText = !isObscureText));
  }

  emitSignUpState(BuildContext context) {
    if (file == null) {
      return warring(context, "erorr", "please choose image");
    }
    if (formkeySignUp.currentState!.validate()) {
    } else {}
  }

  chooseimagegaler() async {
    file = await imageuploadgallery();
    if (file != null) {
      emit(ProfileImageSignUp(profileImage: file!));
    }
  }
}
