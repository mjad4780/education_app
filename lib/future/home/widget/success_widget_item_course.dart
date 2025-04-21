import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/widget/icons_save.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessWidgetItemCourse extends StatelessWidget {
  const SuccessWidgetItemCourse({super.key, required this.course});
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => context.pushName(StringRoute.courseDetailsScrean,
            arguments: course),
        child: Column(
          children: [
            // SvgPicture.asset(
            //     width: width(context) / 2,
            //     height: height(context) / 8,
            //     course
            //             .image ??
            //         ''),
            Container(
              width: width(context) / 2,
              height: height(context) / 8,
              decoration: const ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              width: width(context) / 2,
              height: height(context) / 8,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
                shadows: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(context.translate(course.categoryName ?? ''),
                            style: context.textStyle.labelMedium!.copyWith(
                              color: context.color.orangeBright,
                              fontWeight: FontWeight.w700,
                            )),
                        SaveIcons(courseId: course.id.toString())
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(course.title ?? '',
                            style: context.textStyle.headlineSmall!.copyWith(
                              color: context.color.primaryColor,
                            )),
                      ),
                    ),
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      const Spacer(),
                      course.isFree == false
                          ? Text("\$${course.price ?? ''}",
                              style: context.textStyle.titleMedium!.copyWith(
                                color: context.color.blue,
                                fontWeight: FontWeight.w800,
                              ))
                          : Text("Free",
                              style: context.textStyle.titleMedium!.copyWith(
                                color: context.color.blue,
                                fontWeight: FontWeight.w800,
                              )),
                      const Spacer(),
                      Text('|',
                          style: context.textStyle.titleLarge!
                              .copyWith(color: context.color.black)),
                      const Spacer(),
                      SvgPicture.asset(
                        Assets.imagesStar,
                      ),
                      Text('4.2',
                          style: context.textStyle.displayLarge!
                              .copyWith(color: context.color.primaryColor)),
                      const Spacer(),
                      Text('|',
                          style: context.textStyle.titleLarge!
                              .copyWith(color: context.color.black)),
                      const Spacer(),
                      Text('7830 Std',
                          style: context.textStyle.displayLarge!
                              .copyWith(color: context.color.primaryColor)),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
