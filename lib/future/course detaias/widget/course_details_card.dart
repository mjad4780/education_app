import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';
import '../course_details.dart';
import '../cubit/video_course_cubit.dart';
import 'buttom_video_and_pdf_and_exams.dart';
import 'course_stats_row.dart';

import 'custom_video_course.dart';

class CourseHeader extends StatelessWidget {
  const CourseHeader(
      {super.key,
      required this.courseId,
      required this.isfree,
      required this.videoId});
  final int courseId;
  final bool isfree;
  final int videoId;

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
        child: VideoApp(
          videoId: videoId,
          isfree: isfree,
          courseId: courseId,
        ),
      ),
    );
  }
}

class CourseDetailsCard extends StatelessWidget {
  const CourseDetailsCard({super.key, required this.detailasCourse});
  final DetailasCourse detailasCourse;
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const CourseTitleRow(),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    context.read<VideoCourseCubit>().headCourse!.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle.headlineMedium!.copyWith(
                      color: const Color(0xFF202244),
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(2),
            const CourseStatsRow(),
            verticalSpace(2),
            const Divider(),
            ButtomVideoAndPdfAndExams(
              detailasCourse: detailasCourse,
            ),
            const Spacer(),
          ]),
          // : const Center(
          //     child: CircularProgressIndicator(),
          //   );
        ),
      ),
    );
  }
}
