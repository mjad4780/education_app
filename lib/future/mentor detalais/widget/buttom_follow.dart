import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/mentor%20detalais/logic/cubit/mentor_cubit.dart';
import 'package:flutter/material.dart';
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

class _ButtomFollowState extends State<ButtomFollow>
    with SingleTickerProviderStateMixin {
  late bool isFollowing;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    isFollowing = widget.lastIsFollowing;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: isFollowing ? 1.0 : 0.0, // اللون الافتراضي حسب قيمة isFollowing
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: const Color(0xFF0961F5),
    ).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant ButtomFollow oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.lastIsFollowing == widget.lastIsFollowing) {
      isFollowing = widget.lastIsFollowing;
      if (isFollowing) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      setState(() {
        isFollowing = widget.lastIsFollowing;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (isFollowing) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    context.read<MentorCubit>().updateFollowers(widget.mentorId);

    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTap: _onPressed,
            child: Container(
              // height: 40.h,
              // width: 80.w,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),

              constraints: BoxConstraints(minHeight: 40.h, minWidth: 45.w),

              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: _colorAnimation.value,
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
              child: Text(
                isFollowing ? 'Unfollow' : 'Follow',
                style: context.textStyle.titleLarge!.copyWith(
                  color:
                      isFollowing ? context.color.white : context.color.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
