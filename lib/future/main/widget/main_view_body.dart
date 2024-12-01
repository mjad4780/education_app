import 'package:education/future/chats/screan_chats.dart';
import 'package:education/future/courses/screan_course.dart';
import 'package:education/future/profile/screan_profile.dart';
import 'package:education/future/transaction/screan_transaction.dart';
import 'package:flutter/material.dart';

import '../../home/ui/home_scean.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeScrean(),
        ScreanCourses(),
        ScreanChats(),
        ScreanTransaction(),
        ScreanProfile()
      ],
    );
  }
}
