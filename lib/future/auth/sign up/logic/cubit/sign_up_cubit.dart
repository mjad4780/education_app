import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/function/alert_dialog.dart';
import '../../../../../core/function/upload_image.dart';
import '../../data/model/sign_up_reqest_body.dart';
import '../../data/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  final SignUpRepo signUpRepo;
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
  String? pathImage;
  SignUpReqestBody? body;
  isObscureTextPassword() {
    emit(IsObscureText(isObscureText: isObscureText = !isObscureText));
  }

  emitsignUp(BuildContext context) async {
    if (file == null) {
      return warring(context, "erorr", "please choose image");
    }
    if (!formkeySignUp.currentState!.validate()) return;

    emit(SignupLoading());
    final result = await signUpRepo.signedUploadImage(file!);
    result.fold(
        (failure) => emit(
              SignupFailure(message: failure.message),
            ), (success) async {
      body = SignUpReqestBody(
          email.text,
          password.text,
          DataSignUpBody(
            name.text,
            lastname.text,
            success,
            gender!,
            phone.text,
          ));
      final result = await signUpRepo.signUp(body!);
      result.fold(
        (failure) => emit(
          SignupFailure(message: failure.message),
        ),
        (success) => emit(
          SignupSuccess(successString: success),
        ),
      );
    });
  }

  chooseimagegaler() async {
    file = await imageuploadgallery();
    emit(ProfileImageSignUp(profileImage: file!));

    if (file != null) {}
  }
}
