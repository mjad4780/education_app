import 'package:education/features/home/cubit/home_cubit.dart';
import 'package:education/features/home/data/model/response_home/course.dart';
import 'package:education/features/home/widget/success_widget_item_course.dart';
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
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using built-in animation for empty state
            TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Icon(
                    Icons.school_outlined,
                    size: 100,
                    color: Colors.grey[400],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: 1,
              child: Text(
                "No Courses Available",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              opacity: 1,
              child: Text(
                "Check back later for new courses",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
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
            current is FilterCourseSuccessState ||
            current is FailtercourseLoadedState,
        builder: (context, state) {
          if (state is FailtercourseLoadedState) {
            return LoadingWidget(
                child: SingleChildScrollView(
              child: CustomWidgetCourse(
                  courses: List.generate(2, (index) => Course())),
            ));
          } else if (state is FilterCourseSuccessState) {
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
