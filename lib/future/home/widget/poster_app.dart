import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../utility/images_aseets.dart';

class PosterApp extends StatelessWidget {
  const PosterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) / 4.7,
      width: width(context) / 1.14,
      child: CarouselView(
          itemExtent: 370,
          shrinkExtent: 300,
          children: List.generate(
              7,
              (int i) => Container(
                    height: height(context) / 4.7,
                    width: width(context) / 1.14,
                    decoration: BoxDecoration(
                        color: const Color(0xFF0961F5),
                        borderRadius: BorderRadius.circular(22)),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: SvgPicture.asset(
                            Assets.top,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SvgPicture.asset(
                            Assets.buttom,
                          ),
                        ),
                        Positioned(
                          left: 205,
                          top: 31,
                          child: Container(
                            width: 40,
                            height: 10,
                            decoration: const ShapeDecoration(
                              shape: OvalBorder(
                                side: BorderSide(
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF1A6EFC),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('25% OFF*',
                                  style:
                                      context.textStyle.titleMedium!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  )),
                              verticalSpace(1),
                              Text('Today’s Special',
                                  style: context.textStyle.bodySmall!.copyWith(
                                    color: Colors.white,
                                    fontSize: 22,
                                  )),
                              verticalSpace(2),
                              Text(
                                  'Get a Discount for Every\nCourse Orders only Valid for Today.!',
                                  style: context.textStyle.displaySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }
}
