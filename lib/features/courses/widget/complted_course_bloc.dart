import 'package:education/core/helpers/failer_widget.dart';
import 'package:education/features/courses/cubit/my_course_cubit.dart';
import 'package:education/features/courses/widget/custom_completed_course.dart';
import 'package:education/features/home/data/model/response_home/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/helpers/cache_helper.dart';

class CompletedCourseBlocBuilder extends StatelessWidget {
  const CompletedCourseBlocBuilder({
    super.key,
    required this.valueNotifier,
  });
  final ValueNotifier<List<CourseProgress>> valueNotifier;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCourseCubit, MyCourseState>(
        buildWhen: (previous, current) =>
            current is MyCourseFailer ||
            current is MyCourseLoading ||
            current is MyCourseSuccess,
        builder: (context, state) {
          if (state is MyCourseLoading) {
            return Skeletonizer(
                child: Skeleton.shade(
                    shade: true,
                    child: CustomWidgetCompletedCourse(
                        valueNotifier: valueNotifier,
                        course: List.generate(3, (index) => Course()))));
          } else if (state is MyCourseSuccess) {
            return CustomWidgetCompletedCourse(
              valueNotifier: valueNotifier,
              course: state.courses,
            );
          } else if (state is MyCourseFailer) {
            return FailerWidget(
              messege: state.message,
              onPressed: () =>
                  context.read<MyCourseCubit>().getCompletedCourse(),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
