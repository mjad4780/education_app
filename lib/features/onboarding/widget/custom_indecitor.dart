import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

class CustomIndicor extends StatelessWidget {
  const CustomIndicor({
    super.key,
    required this.isactive,
  });
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isactive ? 30 : 10,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isactive ? context.color.mainBlue : context.color.greyish),
    );
  }
}
