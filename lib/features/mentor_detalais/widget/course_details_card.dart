import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/features/mentor_detalais/widget/courses_mentor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';

import '../../home/data/model/response_home/mentor.dart';
import '../logic/cubit/mentor_cubit.dart';
import 'action_tabs_mentor.dart';
import 'custom_rating_mentor.dart';

class MentorCourseDetailsCard extends StatelessWidget {
  const MentorCourseDetailsCard({super.key, required this.mentor});
  final Mentor mentor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.color.white,
      child: Container(
        // height: height(context) / 1.9,
        // width: width(context) * 0.82,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                mentor.bio ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFA0A4AB),
                  fontSize: 13,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            verticalSpace(8),
            ActionTabsMentor(id: mentor.id ?? 0),
            BlocBuilder<MentorCubit, MentorState>(
              buildWhen: (previous, current) => current is WatchRebuild,
              builder: (context, state) {
                return context.read<MentorCubit>().rebuildCourse
                    ? const CustomRatingMentor()
                    : CoursesMentorsBlocBuilder(
                        mentor: mentor,
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
