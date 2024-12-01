import 'package:education/core/helpers/spacing.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCurriculcum extends StatelessWidget {
  const CustomCurriculcum({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Section 01 - ',
                    style: TextStyle(
                      color: Color(0xFF202244),
                      fontSize: 15,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Introducation',
                    style: TextStyle(
                      color: Color(0xFF0961F5),
                      fontSize: 15,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 3),
            Text(
              '25 Mins',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF0961F5),
                fontSize: 12,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
          ],
        ),
        // verticalSpace(2),
        SizedBox(
          height: height(context) / 3.3,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      clipBehavior: Clip.antiAlias,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF4F8FE),
                        shape: OvalBorder(
                          side: BorderSide(width: 2, color: Color(0xFFE8F1FF)),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '01',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF202244),
                            fontSize: 14,
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          'Why Using Graphic De..',
                          style: TextStyle(
                            color: Color(0xFF202244),
                            fontSize: 16,
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        Text(
                          '15 Mins',
                          style: TextStyle(
                            color: Color(0xFF545454),
                            fontSize: 13,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.videoblue)
                  ],
                ),
                const Divider()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
