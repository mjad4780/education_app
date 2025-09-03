import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utility/images_aseets.dart';
import '../cubit/video_course_cubit.dart';

class CourseStatsRow extends StatelessWidget {
  const CourseStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SvgPicture.asset(Assets.iconvideo),
        horizontalSpace(5),
        Text(
          '21 Class',
          style: context.textStyle.bodySmall!.copyWith(
            color: const Color(0xFF202244),
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(Assets.time),
        horizontalSpace(5),
        Text(
          '42 Hours',
          style: context.textStyle.bodySmall!.copyWith(
            color: const Color(0xFF202244),
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(flex: 4),
        !context.read<VideoCourseCubit>().headCourse!.isFree!
            ? Text(
                "\$${context.read<VideoCourseCubit>().headCourse!.price.toString()} ",
                style: context.textStyle.bodyLarge!.copyWith(
                  color: const Color(0xFF0961F5),
                  fontWeight: FontWeight.w800,
                ),
              )
            : const Spacer(),
      ],
    );
  }
}
