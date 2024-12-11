import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

import '../../../core/language/lang_keys.dart';

class CustomButtomChats extends StatelessWidget {
  const CustomButtomChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            constraints: const BoxConstraints(minHeight: 43, minWidth: 130),
            alignment: Alignment.center, // جعل المحتوى في المنتصف
            decoration: BoxDecoration(
                color: context.color.teal,
                borderRadius: BorderRadius.circular(27)),
            child: Text(context.translate(LangKeys.chat),
                textAlign: TextAlign.center,
                style: context.textStyle.displaySmall!.copyWith(
                    color: const Color(0xFFE8F1FF),
                    fontWeight: FontWeight.w700)),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            constraints: const BoxConstraints(minHeight: 43, minWidth: 130),
            alignment: Alignment.center, // جعل المحتوى في المنتصف
            decoration: BoxDecoration(
                color: const Color(0xFFE8F1FF),
                borderRadius: BorderRadius.circular(27)),
            child: Text(context.translate(LangKeys.calls),
                textAlign: TextAlign.center,
                style: context.textStyle.displaySmall!.copyWith(
                    color: context.color.black, fontWeight: FontWeight.w700)),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
