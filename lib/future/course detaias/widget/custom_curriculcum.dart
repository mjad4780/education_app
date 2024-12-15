import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/course%20detaias/cubit/video_course_cubit.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCurriculcum extends StatelessWidget {
  const CustomCurriculcum({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Section 01 - ',
                    style: context.textStyle.titleMedium!.copyWith(
                      color: const Color(0xFF202244),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'Introducation',
                    style: context.textStyle.titleMedium!.copyWith(
                      color: const Color(0xFF0961F5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 3),
            Text(
              '25 Mins',
              textAlign: TextAlign.right,
              style: context.textStyle.titleSmall!.copyWith(
                color: const Color(0xFF0961F5),
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.3,
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
                      child: Center(
                        child: Text(
                          '01',
                          textAlign: TextAlign.center,
                          style: context.textStyle.titleSmall!.copyWith(
                            color: const Color(0xFF202244),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Why Using Graphic De..',
                          style: context.textStyle.headlineSmall!.copyWith(
                            color: const Color(0xFF202244),
                          ),
                        ),
                        Text(
                          '15 Mins',
                          style: context.textStyle.displaySmall!.copyWith(
                            color: const Color(0xFF545454),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          context
                              .read<VideoCourseCubit>()
                              .initializeVideo(Assets.videoii);
                        },
                        child: SvgPicture.asset(Assets.videoblue)),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
