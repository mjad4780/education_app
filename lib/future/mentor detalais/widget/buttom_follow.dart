import 'dart:developer';

import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/mentor%20detalais/logic/cubit/mentor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtomFollow extends StatefulWidget {
  const ButtomFollow(
      {super.key, required this.lastIsFollowing, required this.mentorId});
  final bool lastIsFollowing;
  final int mentorId;
  @override
  State<ButtomFollow> createState() => _ButtomFollowState();
}

class _ButtomFollowState extends State<ButtomFollow> {
  bool? isFollowing;
  @override
  void initState() {
    super.initState();
    isFollowing = widget.lastIsFollowing;
  }

  @override
  Widget build(BuildContext context) {
    log(isFollowing.toString());

    return Container(
      decoration: ShapeDecoration(
        color: context.color.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0x66B4BDC4)),
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x4C000000),
            blurRadius: 6,
            offset: Offset(1, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: AnimatedButton(
        onPress: () {
          setState(() {
            context.read<MentorCubit>().updateFollowers(widget.mentorId);

            isFollowing = !isFollowing!;
          });
        },
        height: 40.h,

        width: 70.w,

        text: isFollowing! ? 'Unfollow' : "Follow",
        isReverse: true,
        textStyle: context.textStyle.titleLarge!.copyWith(
          color: context.color.white,
        ),
        selectedTextColor: Colors.black,
        transitionType: TransitionType.RIGHT_CENTER_ROUNDER,
        backgroundColor: isFollowing! ? const Color(0xFF0961F5) : Colors.white,
        animationDuration: const Duration(milliseconds: 800),
        borderRadius: 50,
        // borderWidth: 2,
      ),
    );
  }
}

              // isFollowing ? 'Unfollow' : "Follow",

