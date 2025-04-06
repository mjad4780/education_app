import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/widget/success_widget_item_course.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';

class CustomWidgetCourse extends StatelessWidget {
  const CustomWidgetCourse({super.key, required this.courses});
  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
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

// وفي ويدجت CourseItem المنفصلة
