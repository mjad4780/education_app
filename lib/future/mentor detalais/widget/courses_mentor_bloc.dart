import 'package:education/core/helpers/failer_widget.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/data/model/response_home/mentor.dart';
import 'package:education/future/mentor%20detalais/logic/cubit/mentor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/function/top_show_dialog.dart';
import 'custom_widget_course_mentor.dart';

class CoursesMentorsBlocBuilder extends StatefulWidget {
  const CoursesMentorsBlocBuilder({
    super.key,
    required this.mentor,
  });
  final Mentor mentor;
  @override
  State<CoursesMentorsBlocBuilder> createState() =>
      _CoursesMentorsBlocBuilderState();
}

class _CoursesMentorsBlocBuilderState extends State<CoursesMentorsBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<MentorCubit>().getCoursesMentor(widget.mentor.id!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MentorCubit, MentorState>(
        listener: (context, state) {
          if (state is UpdateFollewersFailer) {
            showSnackBar(context, state.message);
          }
        },
        listenWhen: (previous, current) => current is UpdateFollewersFailer,
        buildWhen: (previous, current) =>
            current is MentorCoursesLoading ||
            current is MentorCoursesSuccess ||
            current is MentorCoursesFailer,
        builder: (context, state) {
          if (state is MentorCoursesLoading) {
            return Skeletonizer(
                child: Skeleton.shade(
                    shade: true,
                    child: CustomWidgetCoursesMentor(
                        course: List.generate(2, (index) => Course()))));
          } else if (state is MentorCoursesSuccess) {
            return CustomWidgetCoursesMentor(
              course: state.coursesMentor,
            );
          } else if (state is MentorCoursesFailer) {
            return FailerWidget(
              messege: state.message,
              untext: false,
              onPressed: () {},
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
