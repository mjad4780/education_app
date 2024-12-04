import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';

class ActionTabs extends StatelessWidget {
  const ActionTabs({super.key, this.one, this.two});
  final String? one, two;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: height(context) / 23,
            decoration: const ShapeDecoration(
              color: Color(0xFFF4F8FE),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: Color(0xFFE8F1FF)),
              ),
            ),
            child: Text(
              one ?? 'About',
              textAlign: TextAlign.center,
              style: context.textStyle.titleMedium!.copyWith(
                color: const Color(0xFF202244),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: height(context) / 23,
            decoration: const BoxDecoration(color: Color(0xFFE8F1FF)),
            child: Text(
              two ?? 'Curriculcum',
              textAlign: TextAlign.center,
              style: context.textStyle.titleMedium!.copyWith(
                color: const Color(0xFF202244),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
