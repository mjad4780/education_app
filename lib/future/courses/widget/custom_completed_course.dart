import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/future/courses/widget/course_progress_widget.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:education/widget/custom_cache_networking_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';

class CustomWidgetCompletedCourse extends StatelessWidget {
  const CustomWidgetCompletedCourse({
    super.key,
    required this.course,
    required this.valueNotifier,
  });
  final List<Course> course;
  final ValueNotifier<List<CourseProgress>> valueNotifier;

  @override
  Widget build(BuildContext context) {
    if (course.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using built-in Flutter animation
            TweenAnimationBuilder(
              duration: const Duration(seconds: 1),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Icon(
                    Icons.search_off_rounded,
                    size: 80,
                    color: context.color.primaryColor.withOpacity(0.7),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: 1,
              child: Text(
                'No Courses Available',
                style: context.textStyle.headlineMedium!.copyWith(
                  color: context.color.primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              return AnimatedOpacity(
                duration: Duration(milliseconds: 300 + (i * 100)),
                opacity: 1,
                child: GestureDetector(
                  onTap: () {
                    context.pushName(
                      StringRoute.courseDetailsScrean,
                      arguments: course[i],
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: SizedBox(
                      height: height(context) / 5,
                      child: Row(
                        children: [
                          if (course[i].imageUrl != null)
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: height(context) / 5,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x14000000),
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: CustomCachedNetworkImage(
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                  ),
                                  imageUrl: course[i].imageUrl!,
                                ),
                              ),
                            ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            context.translate(
                                              course[i].categoryName ?? '',
                                            ),
                                            style: context
                                                .textStyle.labelMedium!
                                                .copyWith(
                                              color: context.color.orangeBright,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      course[i].title ?? 'title',
                                      style: context.textStyle.headlineSmall!
                                          .copyWith(
                                        color: context.color.primaryColor,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      course[i].isFree == false
                                          ? "\$${course[i].price ?? ''}"
                                          : "Free",
                                      style: context.textStyle.titleMedium!
                                          .copyWith(
                                        color: context.color.blue,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(Assets.imagesStar),
                                        const SizedBox(width: 4),
                                        Text(
                                          '4.2',
                                          style: context.textStyle.displayLarge!
                                              .copyWith(
                                            color: context.color.primaryColor,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          '|',
                                          style: context.textStyle.titleLarge!
                                              .copyWith(
                                            color: context.color.black,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          '7830 Std',
                                          style: context.textStyle.displayLarge!
                                              .copyWith(
                                            color: context.color.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    ValueListenableBuilder<
                                            List<CourseProgress>>(
                                        valueListenable: valueNotifier,
                                        builder: (context, courses, _) {
                                          // دور على progress اللي ليه نفس id بتاع الكورس
                                          final courseProgress =
                                              courses.firstWhere(
                                            (c) =>
                                                int.parse(c.courseId) ==
                                                course[i].id,
                                            orElse: () => CourseProgress(
                                                courseId:
                                                    course[i].id.toString(),
                                                watchedVideos: []),
                                          );

                                          var values =
                                              courseProgress.watchedVideos;

                                          return Row(
                                            children: [
                                              CourseProgressWidget(
                                                completedVideos: values.length,
                                                totalVideos:
                                                    course[i].countVideo ?? 0,
                                              ),
                                              const Spacer(),
                                              Text(
                                                  '${course[i].countVideo ?? 0}/${values.length}',
                                                  textAlign: TextAlign.right,
                                                  style: context
                                                      .textStyle.displayLarge!
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: context.color
                                                              .primaryColor)),
                                              const Spacer()
                                            ],
                                          );
                                        })
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: course.length,
          ),
        ),
      ],
    );
  }
}
