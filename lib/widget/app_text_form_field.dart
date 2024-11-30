import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final Iterable<String>? autofillHints;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prfixIcon;

  final Color? backgroundColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String?) validator;
  const AppTextFormField({
    super.key,
    this.prfixIcon,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      controller: controller,

      decoration: InputDecoration(
        prefixIcon: prfixIcon,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: context.color.mainBlue,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(22.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: context.color.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(22.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        errorStyle: context.textStyle.bodyMedium!.copyWith(color: Colors.red),
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? context.color.moreLightGray,
        filled: true,
      ),

      obscureText: isObscureText ?? false,
      // style: TextStyles.font14DarkBlueMedium,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
