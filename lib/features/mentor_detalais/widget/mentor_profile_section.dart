import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/features/mentor_detalais/widget/mentor_actions_section.dart';
import 'package:education/utility/constant.dart';
import 'package:education/widget/custom_cache_networking_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';
import '../../home/data/model/response_home/mentor.dart';
import '../logic/cubit/mentor_cubit.dart';

class MentorProfileSection extends StatelessWidget {
  const MentorProfileSection({super.key, required this.mentor});
  final Mentor mentor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.white,
      // width: double.infinity,
      // height: height(context) / 2.68,
      child: Column(
        children: [
          if (mentor.profileImage != null)
            Center(
              child: ClipOval(
                child: CustomCachedNetworkImage(
                  imageUrl: mentor.profileImage!,
                  width: width(context) * 0.28,
                  height: height(context) * 0.14,
                  fit: BoxFit.cover,
                ),
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
                "${mentor.countCourse ?? 0}",
                textAlign: TextAlign.center,
                style: context.textStyle.labelSmall!.copyWith(
                  color: context.color.primaryColor,
                ),
              ),
              const Spacer(),
              BlocSelector<MentorCubit, MentorState, List>(
                selector: (state) {
                  return state is UpdateFollewersSuccess
                      ? mentor.followers = state.followers
                      : mentor.followers ?? [];
                },
                builder: (context, data) {
                  return Text(
                    '${data.length} ',
                    textAlign: TextAlign.center,
                    style: context.textStyle.labelSmall!.copyWith(
                      color: context.color.primaryColor,
                    ),
                  );
                },
              ),
              const Spacer(),
              Text(
                '6',
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
          MentorActionsSection(
            mentor: mentor,
            followingId: getIt<CacheHelper>().getData(key: Keys.userId),
          ),
        ],
      ),
    );
  }
}
