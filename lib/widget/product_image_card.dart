import 'dart:io';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utility/images_aseets.dart';

class ImageProfile extends StatelessWidget {
  final String labelText;
  final String? imageUrlForUpdateImage;
  final File? imageFile;
  final VoidCallback onTap;
  final double? size;
  const ImageProfile({
    super.key,
    required this.labelText,
    this.imageFile,
    this.size,
    required this.onTap,
    this.imageUrlForUpdateImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: context.color.lightBlue,
            backgroundImage: (imageFile != null)
                ? FileImage(
                    imageFile!,
                  )
                : null,
            child: (imageFile == null)
                ? SvgPicture.asset(
                    Assets.imagesPerson,
                  )
                : null,
          ),
          Positioned(
            bottom: 2,
            right: 7,
            child: InkWell(
              onTap: onTap,
              child: CircleAvatar(
                backgroundColor: context.color.teal,
                radius: 17,
                child: SvgPicture.asset(
                  Assets.imagesEditImage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
