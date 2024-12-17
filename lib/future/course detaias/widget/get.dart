import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:education/future/course%20detaias/data/models/course_model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utility/images_aseets.dart';
import '../cubit/video_course_cubit.dart';

const Map<String, dynamic> ahmeder = {
  "lectures": [
    {
      "lectureTitle": "Introduction",
      "lectureDuration": "15 mins",
      "resources": ["Resource 1", "Resource 2", "Resource 3"]
    },
    {
      "lectureTitle": "Setup Environment",
      "lectureDuration": "15 mins",
      "resources": ["Resource 1", "Resource 2", "Resource 3"]
    },
    {
      "lectureTitle": "Why Flutter",
      "lectureDuration": "15 mins",
      "resources": ["Resource 1", "Resource 2", "Resource 3"]
    },
    {
      "lectureTitle": "Stateless Widgets",
      "lectureDuration": "15 mins",
      "resources": ["Resource 1", "Resource 2", "Resource 3"]
    },
    {
      "lectureTitle": "Stateful Widgets",
      "lectureDuration": "15 mins",
      "resources": ["Resource 1", "Resource 2", "Resource 3"]
    },
    {
      "lectureTitle": "Layouts",
      "lectureDuration": "15 mins",
      "resources": ["Resource 1", "Resource 2", "Resource 3"]
    }
  ]
};

class CustomCurriculum2 extends StatelessWidget {
  const CustomCurriculum2({super.key});

  @override
  Widget build(BuildContext context) {
    CourseModel courseModel = CourseModel.fromJson(ahmeder);
    return Column(
      children: [
        SizedBox(
          height: height(context) / 3.3,
          child: ListView.builder(
            itemCount: courseModel.lectures!.length, // عدد الأقسام
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Row(
                  children: [
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${courseModel.lectures![index].lectureTitle} - ',
                                style: context.textStyle.titleMedium!.copyWith(
                                  color: const Color(0xFF202244),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )),
                    const Spacer(),
                    Text(
                      '${5} Mins',
                      style: context.textStyle.titleSmall!.copyWith(
                        color: const Color(0xFF0961F5),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                children: courseModel.lectures![index].resources!.map((value) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // الدائرة الخاصة بالرقم
                            Container(
                              width: 46,
                              height: 46,
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: const ShapeDecoration(
                                color: Color(0xFFF4F8FE),
                                shape: OvalBorder(
                                  side: BorderSide(
                                      width: 2, color: Color(0xFFE8F1FF)),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${1}',
                                  style: context.textStyle.titleSmall!.copyWith(
                                    color: const Color(0xFF202244),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            // النص الخاص بالعنصر
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Why  $value",
                                    style: context.textStyle.headlineSmall!
                                        .copyWith(
                                      color: const Color(0xFF202244),
                                    ),
                                  ),
                                ),
                                Text(
                                  '15 Mins',
                                  style:
                                      context.textStyle.displaySmall!.copyWith(
                                    color: const Color(0xFF545454),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<VideoCourseCubit>()
                                    .initializeVideo(Assets.videoii);
                              },
                              child: const Icon(
                                Icons.play_circle_fill,
                                color: Color(0xFF0961F5),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
