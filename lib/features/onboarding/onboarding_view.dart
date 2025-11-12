import 'dart:async';

import 'package:education/app/education_cubit/education_cubit.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/Router/route_string.dart';
import '../../core/get_it/get_it.dart';
import '../../core/helpers/cache_helper.dart';
import '../../utility/constant.dart';
import 'model/onbording.dart';
import 'widget/custom_indecitor.dart';
import 'widget/custom_skip.dart';
import 'widget/getting_start.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  bool isactive = false;
  int currentinex = 0;
  List<OnbordingModel>? onboaring;
  @override
  void initState() {
    super.initState();
    onboaring = context.read<EducationCubit>().currentLangCode == 'ar'
        ? onboaringAr
        : onboaringEn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          if (currentinex == 0) const CustomSkipAndTheme(),
          const Spacer(
            flex: 10,
          ),
          Expanded(
            child: Stack(children: [
              AnimatedPositioned(
                left: isactive ? width(context) * 100 : width(context) * 0.25,
                duration: const Duration(milliseconds: 300),
                child: Text(
                  onboaring![currentinex].title,
                  style: context.textStyle.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
          Expanded(
            child: Stack(children: [
              AnimatedPositioned(
                  right: isactive
                      ? width(context) * 100
                      : context.read<EducationCubit>().currentLangCode == 'ar'
                          ? 100
                          : 55,
                  duration: const Duration(milliseconds: 250),
                  child: Text(
                    onboaring![currentinex].des,
                    style: context.textStyle.titleLarge!
                        .copyWith(color: Colors.grey),
                  ))
            ]),
          ),
          const Spacer(
            flex: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIndicor(isactive: currentinex == 0),
                    horizontalSpace(5),
                    CustomIndicor(isactive: currentinex == 1),
                    horizontalSpace(5),
                    CustomIndicor(isactive: currentinex == 2),
                  ],
                ),
                GettingStart(
                    currentindex: currentinex,
                    callback: () {
                      setState(() {
                        isactive = !isactive;
                      });
                      if (currentinex == 2) {
                        context.pushNamedAndRemoveUntil(StringRoute.login);
                        getIt<CacheHelper>()
                            .saveData(key: Keys.onboarding, value: true);
                      } else {
                        Timer(const Duration(milliseconds: 250), () {
                          currentinex = currentinex > 1 ? 0 : currentinex + 1;
                          setState(() {
                            isactive = !isactive;
                          });
                        });
                      }
                    })
              ],
            ),
          ),
          verticalSpace(20)
        ]),
      ),
    );
  }
}
