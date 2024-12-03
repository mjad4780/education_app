import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../course_details.dart';
import 'action_tabs.dart';
import 'course_stats_row.dart';
import 'custom_curriculcum.dart';

class CourseHeader extends StatelessWidget {
  const CourseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: height(context) / 2.8,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    );
  }
}

class CourseDetailsCard extends StatelessWidget {
  const CourseDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height(context) * 0.34,
      left: 35,
      right: 35,
      child: Card(
        color: const Color(0xffFFFFFF),
        child: Container(
          height: height(context) / 1.5,
          width: width(context) * 0.82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
          ),
          child: Column(
            children: [
              verticalSpace(25),
              const CourseTitleRow(),
              Text(
                'Design Principles: Organizing ..',
                overflow: TextOverflow.ellipsis,
                style: context.textStyle.headlineMedium!.copyWith(
                  color: const Color(0xFF202244),
                ),
              ),
              verticalSpace(8),
              const CourseStatsRow(),
              verticalSpace(10),
              const ActionTabs(),
              const CustomCurriculcum(),
              const Spacer(),
              const EnrollButton(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
