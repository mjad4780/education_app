import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utility/images_aseets.dart';

class CourseStatsRow extends StatelessWidget {
  const CourseStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SvgPicture.asset(Assets.iconvideo),
        Text(
          '21 Class',
          style: context.textStyle.bodySmall!.copyWith(
            color: const Color(0xFF202244),
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(Assets.time),
        Text(
          '42 Hours',
          style: context.textStyle.bodySmall!.copyWith(
            color: const Color(0xFF202244),
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(flex: 4),
        Text(
          '499/-',
          style: context.textStyle.bodyLarge!.copyWith(
            color: const Color(0xFF0961F5),
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
