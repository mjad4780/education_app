import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/home/data/model/response_home/mentor.dart';

import 'package:education/future/mentor%20detalais/logic/cubit/mentor_cubit.dart';
import 'package:education/future/mentor%20detalais/widget/buttom_follow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/function/build_error_or_success_bar.dart';

class MentorActionsSection extends StatelessWidget {
  const MentorActionsSection(
      {super.key, required this.followingId, required this.mentor});
  final Mentor mentor;
  final String followingId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 2,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: BlocConsumer<MentorCubit, MentorState>(
            listener: (context, state) {
              if (state is UpdateFollewersFailer) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to update followers')),
                );
              } else if (state is UpdateFollewersSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Success to update followers')),
                );
                mentor.followers = state.followers;
              }
            },
            buildWhen: (previous, current) =>
                current is UpdateFollewersFailer ||
                current is UpdateFollewersSuccess,
            listenWhen: (previous, current) =>
                current is UpdateFollewersFailer ||
                current is UpdateFollewersSuccess,
            builder: (context, state) {
              return ButtomFollow(
                mentorId: mentor.id!,
                lastIsFollowing:
                    mentor.followers?.contains(followingId) ?? false,
              );
            },
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.read<MentorCubit>().canChatWithMentor(
                  mentor.id!,
                );
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              constraints: BoxConstraints(minHeight: 40.h, minWidth: 45.w),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: const Color(0xFF0961F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x4C000000),
                    blurRadius: 8,
                    offset: Offset(1, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: BlocConsumer<MentorCubit, MentorState>(
                buildWhen: (previous, current) =>
                    current is CheckChatLoading ||
                    current is CheckChatSuccess ||
                    current is ChaeckChatFailer,
                // listenWhen: (previous, current) =>
                //     current is CheckChatSuccess || current is ChaeckChatFailer,
                builder: (context, state) {
                  if (state is ChaeckChatFailer || state is CheckChatSuccess) {
                    return Text('Message',
                        textAlign: TextAlign.center,
                        style: context.textStyle.titleLarge!.copyWith(
                          color: context.color.white,
                        ));
                  } else if (state is CheckChatLoading) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  } else {
                    return Text('Message',
                        textAlign: TextAlign.center,
                        style: context.textStyle.titleLarge!.copyWith(
                          color: context.color.white,
                        ));
                  }
                },
                listener: (context, state) {
                  if (state is CheckChatSuccess) {
                    context.pushName(
                      StringRoute.screanChatsMentors,
                      arguments: mentor.id!,
                    );
                  } else if (state is ChaeckChatFailer) {
                    buildErorr(context, state.message);
                  }
                },
              )),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
