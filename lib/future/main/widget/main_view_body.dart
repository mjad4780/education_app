import 'package:education/future/chats/screan_chats.dart';
import 'package:education/future/courses/screan_course.dart';
import 'package:education/future/profile/ui/screan_profile.dart';
import 'package:education/future/transaction/screan_transaction.dart';
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
        _KeepAlivePage(child: HomeScrean()),
        _KeepAlivePage(child: ScreenCourses()),
        _KeepAlivePage(child: ScreanChats()),
        _KeepAlivePage(child: ScreanTransaction()),
        _KeepAlivePage(child: ScreanProfile())
      ],
    );
  }
}

class _KeepAlivePage extends StatefulWidget {
  const _KeepAlivePage({
    required this.child,
  });

  final Widget child;

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<_KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
