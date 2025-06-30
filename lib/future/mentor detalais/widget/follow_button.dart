import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  final Function() onPressed;
  final ValueNotifier<bool> isFollowing;
  const FollowButton({
    super.key,
    required this.onPressed,
    required this.isFollowing,
  });

  @override
  FollowButtonState createState() => FollowButtonState();
}

class FollowButtonState extends State<FollowButton>
    with SingleTickerProviderStateMixin {
  // final ValueNotifier<bool> isFollowing ;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  Future<void> _animateButton() async {
    await _animationController.forward();
    await _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.isFollowing,
      builder: (context, isFollowing, child) {
        return GestureDetector(
          onTap: () async {
            await _animateButton();
            widget.isFollowing.value =
                !widget.isFollowing.value; // Toggle value
            widget.onPressed();
          },
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Text(
              isFollowing ? 'Unfollow' : "Follow",
              textAlign: TextAlign.center,
              style: context.textStyle.titleLarge!.copyWith(
                color: isFollowing ? Colors.black : context.color.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
