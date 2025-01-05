import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/courses/cubit/my_course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/language/lang_keys.dart';

class CustombuttomMyCourse extends StatelessWidget {
  const CustombuttomMyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MyCourseCubit, MyCourseState, bool>(
        selector: (state) => state is WatchRebuild ? state.rebuild : true,
        builder: (context, isrebuild) {
          return Row(
            children: [
              const Spacer(
                flex: 2,
              ),
              GestureDetector(
                onTap: () => context.read<MyCourseCubit>().watchcourse(true),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  constraints:
                      const BoxConstraints(minHeight: 55, minWidth: 130),
                  alignment: Alignment.center, // جعل المحتوى في المنتصف
                  decoration: BoxDecoration(
                      color: isrebuild
                          ? context.color.teal
                          : const Color(0xFFE8F1FF),
                      borderRadius: BorderRadius.circular(27)),
                  child: Text(context.translate(LangKeys.completedCourses),
                      textAlign: TextAlign.center,
                      style: context.textStyle.displaySmall!.copyWith(
                          color: isrebuild
                              ? const Color(0xFFE8F1FF)
                              : context.color.black,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              GestureDetector(
                onTap: () => context.read<MyCourseCubit>().watchcourse(false),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  constraints:
                      const BoxConstraints(minHeight: 55, minWidth: 130),
                  alignment: Alignment.center, // جعل المحتوى في المنتصف
                  decoration: BoxDecoration(
                      color: isrebuild
                          ? const Color(0xFFE8F1FF)
                          : context.color.teal,
                      borderRadius: BorderRadius.circular(27)),
                  child: Text(context.translate(LangKeys.ongoingCourses),
                      textAlign: TextAlign.center,
                      style: context.textStyle.displaySmall!.copyWith(
                          color: isrebuild
                              ? context.color.black
                              : const Color(0xFFE8F1FF),
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          );
        });
  }
}
