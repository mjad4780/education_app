import 'package:education/future/courses/cubit/my_course_cubit.dart';
import 'package:education/future/courses/widget/custom_completed_course.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CompletedCourseBlocBuilder extends StatelessWidget {
  const CompletedCourseBlocBuilder({super.key, required this.valueListenable});
  final ValueListenable<int> valueListenable;

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
                        valueListenable: valueListenable,
                        course: List.generate(3, (index) => Course()))));
          } else if (state is MyCourseSuccess) {
            return CustomWidgetCompletedCourse(
              valueListenable: valueListenable,
              course: state.courses,
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
