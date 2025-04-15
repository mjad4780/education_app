import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/mentor%20detalais/widget/mentor_actions_section.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../home/data/model/response_home/mentor.dart';

class MentorProfileSection extends StatelessWidget {
  const MentorProfileSection({super.key, required this.mentor});
  final Mentor mentor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.white,
      width: double.infinity,
      height: height(context) / 2.68,
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(mentor.profileImage ?? ''),
            ),
          ),
          verticalSpace(2),
          Text(
            mentor.name ?? '',
            textAlign: TextAlign.center,
            style: context.textStyle.bodyLarge!.copyWith(
              color: context.color.primaryColor,
            ),
          ),
          verticalSpace(2),
          Text(
            mentor.title ?? '',
            textAlign: TextAlign.center,
            style: context.textStyle.displaySmall!.copyWith(
              color: context.color.greyDark,
            ),
          ),
          verticalSpace(4),
          Row(
            children: [
              const Spacer(),
              Text(
                '26',
                textAlign: TextAlign.center,
                style: context.textStyle.labelSmall!.copyWith(
                  color: context.color.primaryColor,
                ),
              ),
              const Spacer(),
              Text(
                '15800',
                textAlign: TextAlign.center,
                style: context.textStyle.labelSmall!.copyWith(
                  color: context.color.primaryColor,
                ),
              ),
              const Spacer(),
              Text(
                '8750',
                textAlign: TextAlign.center,
                style: context.textStyle.labelSmall!.copyWith(
                  color: context.color.primaryColor,
                ),
              ),
              const Spacer()
            ],
          ),
          verticalSpace(2),
          Row(
            children: [
              const Spacer(),
              Text(
                'Courses',
                textAlign: TextAlign.center,
                style: context.textStyle.displaySmall!.copyWith(
                  color: context.color.greyDark,
                ),
              ),
              const Spacer(),
              Text(
                'Students',
                textAlign: TextAlign.center,
                style: context.textStyle.displaySmall!.copyWith(
                  color: context.color.greyDark,
                ),
              ),
              const Spacer(),
              Text(
                'Ratings',
                textAlign: TextAlign.center,
                style: context.textStyle.displaySmall!.copyWith(
                  color: context.color.greyDark,
                ),
              ),
              const Spacer()
            ],
          ),
          verticalSpace(10),
          const MentorActionsSection(),
        ],
      ),
    );
  }
}
