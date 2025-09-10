import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/home/data/model/response_notification.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.color.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: notification.isRead ? Colors.grey : Colors.blue,
          ),
        ),
        title: Text(
          notification.title,
          style: TextStyle(
            fontWeight:
                notification.isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(notification.description),
        trailing: Text(
          notification.time,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
