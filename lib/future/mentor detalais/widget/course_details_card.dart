import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';

import '../logic/cubit/mentor_cubit.dart';
import 'action_tabs_mentor.dart';
import 'custom_my_course_mentor.dart';
import 'custom_rating_mentor.dart';

class MentorCourseDetailsCard extends StatelessWidget {
  const MentorCourseDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.color.white,
      child: Container(
        height: height(context) / 2,
        width: width(context) * 0.82,
        decoration: ShapeDecoration(
          color: context.color.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            verticalSpace(3),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '"But how much, or rather, can it now do as much as it did then? Nor am I unaware that there is utility in history, not only pleasure."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFA0A4AB),
                  fontSize: 13,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            BlocBuilder<MentorCubit, MentorState>(
              buildWhen: (previous, current) => current is WatchRebuild,
              builder: (context, state) {
                return Column(
                  children: [
                    verticalSpace(8),
                    const ActionTabsMentor(),
                    context.read<MentorCubit>().rebuildCourse
                        ? const CustomRatingMentor()
                        : const CustomMyCourseMentor()
                  ],
                );
              },
            ),
            verticalSpace(8),
          ],
        ),
      ),
    );
  }
}
