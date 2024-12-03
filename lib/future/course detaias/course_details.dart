import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/language/lang_keys.dart';
import '../../widget/app_text_button.dart';
import 'widget/course_details_card.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CourseHeader(),
          const CourseDetailsCard(),
          Positioned(
            right: 34,
            top: height(context) * 0.30,
            child: SvgPicture.asset(Assets.video),
          ),
        ],
      ),
    );
  }
}

class CourseTitleRow extends StatelessWidget {
  const CourseTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'Graphic Design',
            style: context.textStyle.titleSmall!.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFFFF6B00),
            ),
          ),
          const Spacer(),
          SvgPicture.asset(Assets.imagesStar),
          Text(
            '4.2',
            style: context.textStyle.displayLarge!.copyWith(
              color: context.color.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class EnrollButton extends StatelessWidget {
  const EnrollButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonHeight: 20,
      buttonText: '${context.translate(LangKeys.enroll)} - 499/-',
      onPressed: () {},
      textStyle: context.textStyle.bodyMedium!,
    );
  }
}
