import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../utility/images_aseets.dart';

class CustomWidgetPoluparCourse extends StatelessWidget {
  const CustomWidgetPoluparCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context),
      height: height(context),
      child: CarouselView(
          scrollDirection: Axis.vertical,
          itemExtent: 160,
          shrinkExtent: 160,
          children: List.generate(
            5,
            (int i) => Row(
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
                              const Spacer(),
                              SvgPicture.asset(
                                Assets.noActiveSave,
                                height: 20,
                              ),
                              // const Spacer(),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Align(
                          // alignment: Alignment.centerLeft,
                          child: Text('Graphic Design Advanced',
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyle.headlineSmall!.copyWith(
                                color: context.color.primaryColor,
                              )),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 11),
                            child: Text('850/-',
                                style: context.textStyle.titleMedium!.copyWith(
                                  color: context.color.blue,
                                  fontWeight: FontWeight.w800,
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
                                style: context.textStyle.displayLarge!.copyWith(
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
                                style: context.textStyle.displayLarge!.copyWith(
                                    color: context.color.primaryColor)),
                            const Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
