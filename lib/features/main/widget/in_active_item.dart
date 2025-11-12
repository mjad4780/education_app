import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemNav extends StatelessWidget {
  const ItemNav({super.key, required this.image, required this.active});

  final String image;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      color: active ? const Color(0xFF167F71) : context.color.primaryColor,
    );
  }
}






