import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../utility/images_aseets.dart';

class CustomWidgetCourse extends StatelessWidget {
  const CustomWidgetCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context) / 1.5 * 2,
      height: height(context) / 4 + 2,
      child: CarouselView(
          itemExtent: 250,
          shrinkExtent: 250,
          children: List.generate(
            3,
            (int i) => Column(
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
                              horizontal: 1, vertical: 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Graphic Design',
                                  style:
                                      context.textStyle.labelMedium!.copyWith(
                                    color: context.color.orangeBright,
                                    fontWeight: FontWeight.w700,
                                  )),
                              SvgPicture.asset(
                                Assets.noActiveSave,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          // alignment: Alignment.centerLeft,
                          child: Text('Graphic Design Advanced',
                              style: context.textStyle.headlineSmall!.copyWith(
                                color: context.color.primaryColor,
                              )),
                        ),
                        verticalSpace(10),
                        Row(
                          children: [
                            const Spacer(),
                            Text('  850/-',
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
                                style: context.textStyle.displayLarge!.copyWith(
                                    color: context.color.primaryColor)),
                            const Spacer(),
                            Text('|',
                                style: context.textStyle.titleLarge!
                                    .copyWith(color: context.color.black)),
                            const Spacer(),
                            Text('7830 Std',
                                style: context.textStyle.displayLarge!.copyWith(
                                    color: context.color.primaryColor))
                          ],
                        ),
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
