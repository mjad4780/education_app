import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

class MentorActionsSection extends StatelessWidget {
  const MentorActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 2,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          constraints: const BoxConstraints(minHeight: 55, minWidth: 70),
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: context.color.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Color(0x66B4BDC4)),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            'Follow',
            textAlign: TextAlign.center,
            style: context.textStyle.titleLarge!.copyWith(
              color: context.color.primaryColor,
            ),
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          constraints: const BoxConstraints(minHeight: 55, minWidth: 70),
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: const Color(0xFF0961F5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x4C000000),
                blurRadius: 8,
                offset: Offset(1, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Text(
            'Message',
            textAlign: TextAlign.center,
            style: context.textStyle.titleLarge!.copyWith(
              color: context.color.white,
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
