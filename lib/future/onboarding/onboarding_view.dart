import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/style/styles.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: context.color.mainColor,
      child: Center(
        child: SizedBox(
            width: 300,
            height: 300,
            child: Text(context.translate('login'), style: TextStyles.bold13
                //  context.textStyle.copyWith(fontSize: 16.sp),
                )),
      ),
    ));
  }
}
