import 'package:education/future/home/cubit/home_cubit.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/widget/success_widget_item_course.dart';
import 'package:education/utility/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/helpers/spacing.dart';

class CustomWidgetCourse extends StatelessWidget {
  const CustomWidgetCourse({super.key, required this.courses});
  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return const Center(
          child: Text(
        "No Courses ",
        style: TextStyle(color: Colors.red, fontSize: 20),
      ));
    } else {
      return SizedBox(
          width: width(context),
          height: height(context) / 3.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            itemBuilder: (context, index) =>
                SuccessWidgetItemCourse(course: courses[index]),
          ));
    }
  }
}

// وفي ويدجت CourseItem المنفصلة

class CoursesBlocBuilder extends StatelessWidget {
  const CoursesBlocBuilder({super.key, required this.courses});
  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is FilterCourseState || current is FailtercourseLoadedState,
        builder: (context, state) {
          if (state is FailtercourseLoadedState) {
            return LoadingWidget(
                child: SingleChildScrollView(
              child: CustomWidgetCourse(
                  courses: List.generate(2, (index) => Course())),
            ));
          } else if (state is FilterCourseState) {
            return CustomWidgetCourse(
              courses: state.courses,
            );
          } else {
            return CustomWidgetCourse(
              courses: courses,
            );
          }
        });
  }
}
