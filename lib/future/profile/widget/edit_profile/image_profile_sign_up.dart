import 'dart:io';

import 'package:education/future/profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/images_aseets.dart';
import '../../../../widget/product_image_card.dart';

class ImageEditProfileBloc extends StatelessWidget {
  const ImageEditProfileBloc({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, File?>(
      selector: (state) => state is ProfileImageSignUp
          ? state.profileImage
          : context.read<ProfileCubit>().file,
      builder: (context, profileImage) {
        return ImageProfile(
          imageSvg: Assets.photos,
          imageFile: profileImage,
          labelText: 'image',
          onTap: () async {
            await context.read<ProfileCubit>().chooseimagegaler();
          },
        );
      },
    );
  }
}
