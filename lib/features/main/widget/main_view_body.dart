import 'package:education/features/chats/screan_chats.dart';
import 'package:education/features/courses/screan_course.dart';
import 'package:education/features/profile/ui/screan_profile.dart';
import 'package:education/features/transaction/screan_transaction.dart';
import 'package:flutter/material.dart';

import '../../home/ui/home_scean.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentViewIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(MainViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentViewIndex != widget.currentViewIndex) {
      _pageController.jumpToPage(widget.currentViewIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        KeepAlivePage(child: HomeScrean()),
        KeepAlivePage(child: ScreenCourses()),
        KeepAlivePage(child: ScreanChats()),
        KeepAlivePage(child: ScreanTransaction()),
        KeepAlivePage(child: ScreanProfile())
      ],
    );
  }
}

class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  KeepAlivePageState createState() => KeepAlivePageState();
}

class KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
