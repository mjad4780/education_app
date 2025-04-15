import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/home/cubit/home_cubit.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/widget/icons_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../utility/images_aseets.dart';

class FilterCoursesBlocBuilder extends StatelessWidget {
  const FilterCoursesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is FilterCourseState || current is FailtercourseLoadedState,
        builder: (context, state) {
          if (state is FailtercourseLoadedState) {
            return Skeletonizer(
                child: Skeleton.shade(
                    shade: true,
                    child: CustomWidgetPoluparCourse(
                        course: List.generate(3, (index) => Course()))));
          } else if (state is FilterCourseState) {
            return CustomWidgetPoluparCourse(
              course: state.courses,
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

class CustomWidgetPoluparCourse extends StatelessWidget {
  const CustomWidgetPoluparCourse({super.key, required this.course});
  final List<Course> course;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context),
      height: height(context),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        itemCount: course.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => context.pushName(StringRoute.courseDetailsScrean,
                arguments: course[i]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height(context) / 5, // تحديد ارتفاع ثابت لكل عنصر
                child: Row(
                  children: [
                    //   Expanded(
                    //   flex: 3, // جزء الصورة يأخذ 40% من المساحة
                    //   child: Container(
                    //     height: height(context) / 5,
                    //     decoration: const BoxDecoration(
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Color(0x14000000),
                    //           blurRadius: 10,
                    //           offset: Offset(0, 4),
                    //           spreadRadius: 0,
                    //         )
                    //       ],
                    //     ),
                    //     child: const SmartNetworkImage(
                    //         borderRadius: BorderRadius.horizontal(
                    //           left: Radius.circular(20),
                    //         ),
                    //         // fit: BoxFit.fill,
                    //         imageUrl:
                    //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0ZlsNTn5aoqO_FLIDqiICO0J_miT7b9IWtw&s"),
                    //   ),
                    // ),
                    Expanded(
                      flex: 2, // جزء الصورة يأخذ 40% من المساحة
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image:
                              DecorationImage(image: AssetImage(Assets.image)),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3, // جزء المحتوى يأخذ 60% من المساحة
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // الصف العلوي (التصنيف + زر الحفظ)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      context.translate(
                                          course[i].categoryName ?? ''),
                                      style: context.textStyle.labelMedium!
                                          .copyWith(
                                        color: context.color.orangeBright,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SaveIcons(courseId: course[i].id.toString()),
                                ],
                              ),

                              // عنوان الكورس
                              Text(
                                course[i].title ?? 'title',
                                style:
                                    context.textStyle.headlineSmall!.copyWith(
                                  color: context.color.primaryColor,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                              // السعر
                              Text(
                                course[i].paid ?? false
                                    ? "\$${course[i].price ?? ''}"
                                    : "Free",
                                style: context.textStyle.titleMedium!.copyWith(
                                  color: context.color.blue,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),

                              // التقييم وعدد الطلاب
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    style:
                                        context.textStyle.titleLarge!.copyWith(
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
