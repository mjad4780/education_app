import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/images_aseets.dart';
import '../../../../widget/product_image_card.dart';
import '../logic/cubit/sign_up_cubit.dart';

class ImageProfileBloc extends StatelessWidget {
  const ImageProfileBloc({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignUpCubit, SignUpState, File?>(
      selector: (state) => state is ProfileImageSignUp
          ? state.profileImage
          : context.read<SignUpCubit>().file,
      builder: (context, profileImage) {
        return ImageProfile(
          imageSvg: Assets.imagesEditImage,
          imageFile: profileImage,
          labelText: 'image',
          onTap: () async {
            await context.read<SignUpCubit>().chooseimagegaler();
          },
        );
      },
    );
  }
}
