import 'package:flutter/material.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../utility/images_aseets.dart';
import 'course_progress_widget.dart';

class CustomOngoingCourse extends StatelessWidget {
  const CustomOngoingCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width(context),
        height: height(context) / 2,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 140,
              child: Row(
                children: [
                  Expanded(
                    // flex: 2,
                    child: Container(
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
                  ),
                  Expanded(
                    child: Container(
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 11, vertical: 11),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // const Spacer(),
                                Text('Graphic Design',
                                    style:
                                        context.textStyle.labelMedium!.copyWith(
                                      color: context.color.orangeBright,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Align(
                            // alignment: Alignment.centerLeft,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('Graphic Design Advanced',
                                  // overflow: TextOverflow.fade,
                                  style:
                                      context.textStyle.headlineSmall!.copyWith(
                                    color: context.color.primaryColor,
                                  )),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Spacer(
                                flex: 2,
                              ),
                              SvgPicture.asset(
                                Assets.imagesStar,
                              ),
                              Text('4.2',
                                  style: context.textStyle.displayLarge!
                                      .copyWith(
                                          color: context.color.primaryColor)),
                              const Spacer(
                                flex: 1,
                              ),
                              Text('|',
                                  style: context.textStyle.titleLarge!
                                      .copyWith(color: context.color.black)),
                              const Spacer(
                                flex: 1,
                              ),
                              Text('7830 Std',
                                  style: context.textStyle.displayLarge!
                                      .copyWith(
                                          color: context.color.primaryColor)),
                              const Spacer(
                                flex: 2,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                const CourseProgressWidget(
                                  totalVideos: 20,
                                  completedVideos:
                                      10, // يمكن تحديث هذا العدد بناءً على الإنجاز
                                ),
                                Text('93/125',
                                    textAlign: TextAlign.right,
                                    style: context.textStyle.displayLarge!
                                        .copyWith(
                                            color: context.color.primaryColor))
                              ],
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
