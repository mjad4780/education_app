import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../utility/images_aseets.dart';

class CustomRatingMentor extends StatelessWidget {
  const CustomRatingMentor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) / 3.4,
      width: width(context) * 0.82,
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                      ),
                      horizontalSpace(4),
                      const Text(
                        'Mary',
                        style: TextStyle(
                          color: Color(0xFF202244),
                          fontSize: 17,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 40,
                        height: 28,
                        margin: const EdgeInsets.all(11),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE8F1FF),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 2, color: Color(0xFF4D81E5)),
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.imagesStar,
                            ),
                            Text('4.2',
                                style: context.textStyle.displayLarge!.copyWith(
                                    color: context.color.primaryColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      'This course has been very useful.Mentor was well spoken totally loved it.',
                      style: TextStyle(
                        color: Color(0xFF545454),
                        fontSize: 13,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        Assets.like,
                      ),
                      const Text(
                        '760',
                        style: TextStyle(
                          color: Color(0xFF202244),
                          fontSize: 12,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '2 Weeks Agos',
                        style: TextStyle(
                          color: Color(0xFF202244),
                          fontSize: 12,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  const Divider(),
                ],
              )),
    );
  }
}
