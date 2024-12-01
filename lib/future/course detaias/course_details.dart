import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/language/lang_keys.dart';
import '../../widget/app_text_button.dart';
import 'widget/custom_curriculcum.dart';

class CourseDetailsScrean extends StatelessWidget {
  const CourseDetailsScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0, // أضف القيود المناسبة
            child: Container(
              height: height(context) / 2.8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(11),
              ),
            ),
          ),
          Positioned(
            top: height(context) * 0.34,
            // bottom: height(context) * 0.13,
            left: 35,
            right: 35, // أضف قيود العرض للتأكد من تحديده
            child: Card(
              color: const Color(0xffFFFFFF),
              child: Container(
                height: height(context) / 1.5,
                width: width(context) * 0.82,
                decoration: BoxDecoration(
                  // color: const Color.fromARGB(179, 79, 77, 77),
                  borderRadius: BorderRadius.circular(27),
                ),
                child: Column(
                  children: [
                    verticalSpace(25),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Graphic Design',
                            style: TextStyle(
                              color: Color(0xFFFF6B00),
                              fontSize: 12,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            Assets.imagesStar,
                          ),
                          Text('4.2',
                              style: context.textStyle.displayLarge!
                                  .copyWith(color: context.color.primaryColor)),
                        ],
                      ),
                    ),
                    const Text(
                      'Design Principles: Organizing ..',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF202244),
                        fontSize: 20,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    verticalSpace(8),
                    Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset(Assets.iconvideo),
                        const Text(
                          '21 Class',
                          style: TextStyle(
                            color: Color(0xFF202244),
                            fontSize: 11,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(Assets.time),
                        const Text(
                          '42 Hours',
                          style: TextStyle(
                            color: Color(0xFF202244),
                            fontSize: 11,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                        const Spacer(
                          flex: 4,
                        ),
                        const Text(
                          '499/-',
                          style: TextStyle(
                            color: Color(0xFF0961F5),
                            fontSize: 21,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            // width: 180,
                            height: height(context) / 23,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFF4F8FE),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 2, color: Color(0xFFE8F1FF)),
                              ),
                            ),
                            child: const Text(
                              'About',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 15,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // width: 180,
                            height: height(context) / 23,
                            decoration:
                                const BoxDecoration(color: Color(0xFFE8F1FF)),
                            child: const Text(
                              'Curriculcum',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 15,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: Align(
                    //     alignment: Alignment.centerRight,
                    //     child: Text(
                    //       'Graphic Design now a popular profession graphic hfhchfgujg design by off your carrer about tantas regiones barbarorum pedibus obiit',
                    //       style: TextStyle(
                    //         color: Color(0xFFA0A4AB),
                    //         fontSize: 13,
                    //         fontFamily: 'Mulish',
                    //         fontWeight: FontWeight.w700,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const CustomCurriculcum(),
                    const Spacer(),
                    AppTextButton(
                      buttonHeight: 20,
                      buttonText:
                          '${context.translate(LangKeys.enroll)} - 499/-',
                      onPressed: () {},
                      textStyle: const TextStyle(),
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 34,
              top: height(context) * 0.30,
              child: SvgPicture.asset(Assets.video)),
        ],
      ),
    );
  }
}
