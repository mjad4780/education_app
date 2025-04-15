import 'package:education/future/home/data/model/response_notification.dart';
import 'package:education/future/home/widget/custom_notification_card.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Notifications'),
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
