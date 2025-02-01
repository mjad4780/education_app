import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';
import '../course_details.dart';
import '../cubit/video_course_cubit.dart';
import 'buttom_video_and_pdf_and_exams.dart';
import 'course_stats_row.dart';

import 'custom_video_course.dart';

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
          borderRadius: BorderRadius.circular(11),
        ),
        child: const VideoApp(),
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
          height: height(context) / 1.55,
          width: width(context) * 0.82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
          ),
          child: BlocBuilder<VideoCourseCubit, VideoCourseState>(
            // buildWhen: (previous, current) => current is FillterCourse,
            builder: (context, state) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    verticalSpace(25),
                    const CourseTitleRow(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            context
                                    .read<VideoCourseCubit>()
                                    .headCourse!
                                    .title ??
                                '',
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyle.headlineMedium!.copyWith(
                              color: const Color(0xFF202244),
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(8),
                    const CourseStatsRow(),
                    verticalSpace(10),
                    const Divider(),
                    const ButtomVideoAndPdfAndExams(),
                    const Spacer(),
                    context.read<VideoCourseCubit>().headCourse!.paid!
                        ? const EnrollButton()
                        : const SizedBox.shrink(),
                    verticalSpace(20),
                  ]);
              // : const Center(
              //     child: CircularProgressIndicator(),
              //   );
            },
          ),
        ),
      ),
    );
  }
}
