import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/features/home/data/model/response_notification.dart';
import 'package:education/features/home/widget/custom_notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "New Course Available",
      description: "Check out our new Flutter course!",
      time: "2 hours ago",
      isRead: false,
    ),
    NotificationItem(
      title: "Assignment Due",
      description: "Your programming assignment is due tomorrow",
      time: "5 hours ago",
      isRead: true,
    ),
    // Add more static notifications as needed
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          SvgPicture.asset(Assets.imagesSearchGray),
          horizontalSpace(13)
        ],
        title: Text(context.translate(LangKeys.notifications),
            style: context.textStyle.bodyLarge),
      ),
      body: FadeTransition(
        opacity: _animation,
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Interval(
                  (index / notifications.length),
                  1.0,
                  curve: Curves.easeOut,
                ),
              )),
              child: NotificationCard(notification: notifications[index]),
            );
          },
        ),
      ),
    );
  }
}
