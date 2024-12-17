import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/course%20detaias/cubit/video_course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';

class ActionTabs extends StatelessWidget {
  const ActionTabs({super.key, this.one, this.two});
  final String? one, two;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.read<VideoCourseCubit>().watchcourse(false);
            },
            child: Container(
              height: height(context) / 23,
              decoration: ShapeDecoration(
                color: context.read<VideoCourseCubit>().rebuildCourse
                    ? const Color(0xFFF4F8FE)
                    : const Color(0xFFE8F1FF),
                shape: const RoundedRectangleBorder(
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
        ),
        Expanded(
            child: GestureDetector(
          onTap: () {
            context.read<VideoCourseCubit>().watchcourse(true);
          },
          child: Container(
            height: height(context) / 23,
            decoration: ShapeDecoration(
              color: context.read<VideoCourseCubit>().rebuildCourse
                  ? const Color(0xFFE8F1FF)
                  : const Color(0xFFF4F8FE),
              shape: const RoundedRectangleBorder(
                side: BorderSide(width: 2, color: Color(0xFFE8F1FF)),
              ),
            ),
            child: Text(
              two ?? context.translate(LangKeys.curriculum),
              textAlign: TextAlign.center,
              style: context.textStyle.titleMedium!.copyWith(
                color: const Color(0xFF202244),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
