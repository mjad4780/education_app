import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

class MentorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MentorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.color.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: context.color.black,
          size: 30,
        ),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
