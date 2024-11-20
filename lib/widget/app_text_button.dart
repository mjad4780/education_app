import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? context.color.blue,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 11.w,
            vertical: verticalPadding?.h ?? 4.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: context.textStyle.headlineMedium!
                  .copyWith(color: context.color.white, fontSize: 19),
            ),
          ),
          const Spacer(),
          Container(
            width: width(context) / 9,
            height: height(context),
            decoration: BoxDecoration(
                color: context.color.white,
                borderRadius: BorderRadius.circular(60)),
            child: Icon(
              Icons.arrow_forward,
              color: context.color.blue,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
