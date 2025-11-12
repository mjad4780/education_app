import 'dart:io';

import 'package:education/features/profile/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/function/upload_image.dart';
import '../../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  final ProfileRepoImpl profileRepo;

  AutovalidateMode autovalidateModeSignUp = AutovalidateMode.disabled;
  GlobalKey<FormState> formkeySignUp = GlobalKey<FormState>();

  String? gender;
  File? file;
  bool isObscureText = true;
  String? pathImage;

  isObscureTextPassword() {
    emit(IsObscureText(isObscureText: isObscureText = !isObscureText));
  }

  chooseimagegaler() async {
    file = await imageuploadcamer();
    if (file != null) {
      emit(ProfileImageSignUp(profileImage: file!));
    }
  }

  Future<void> getUser() async {
    emit(GetUserLoading());
    final result = await profileRepo.getUser();
    result.fold(
      (failure) => emit(GetUserFailure(message: failure.message)),
      (user) => emit(GetUserSuccess(user)),
    );
  }

  Future<void> updateUserAndImageProfile(ProfileModel profileModel) async {
    emit(UpdateUserLoading());
    final result = await profileRepo.updateUserAndImageProfile(profileModel);
    result.fold((failure) {
      emit(UpdateUserFailure(message: failure.message));
    }, (user) {
      emit(UpdateUserSuccess(user: user));
      file = null;
    });
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await profileRepo.logout();
    result.fold(
      (failure) => emit(LogoutFailure(message: failure.message)),
      (_) => emit(LogoutSuccess()),
    );
  }
}
