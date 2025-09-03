import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
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
  final String imageSvg;
  const ImageProfile({
    super.key,
    required this.labelText,
    this.imageFile,
    this.size,
    required this.onTap,
    this.imageUrlForUpdateImage,
    required this.imageSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: const ShapeDecoration(
              color: Color(0xFFD7D7D7),
              shape: OvalBorder(
                side: BorderSide(
                  width: 4,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFF167F71),
                ),
              ),
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: context.color.lightBlue,
              backgroundImage: (imageFile != null)
                  ? FileImage(
                      imageFile!,
                    )
                  : (imageUrlForUpdateImage != null)
                      ? CachedNetworkImageProvider(imageUrlForUpdateImage!)
                      : null,
              child: (imageFile == null && imageUrlForUpdateImage == null)
                  ? SvgPicture.asset(
                      Assets.imagesPerson,
                    )
                  : null,
            ),
          ),
          Positioned(
            bottom: 2,
            right: 7,
            child: InkWell(
              onTap: onTap,
              child: CircleAvatar(
                backgroundColor: context.color.teal,
                radius: 17,
                child: SvgPicture.asset(imageSvg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
