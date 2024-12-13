import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/function/upload_image.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
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
  isObscureTextPassword() {
    emit(IsObscureText(isObscureText: isObscureText = !isObscureText));
  }

  chooseimagegaler() async {
    file = await imageuploadgallery();
    emit(ProfileImageSignUp(profileImage: file!));

    if (file != null) {}
  }
}
