import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/repository/notification_service.dart';
import 'header_widget.dart';
import 'notification_widget.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  final NotificationService _notificationService = Get.find<NotificationService>();

  @override
  Widget build(BuildContext context) {
    final notifications = <Widget>[];

    for (final notification in _notificationService.getNotifications()) {
      notifications.add(
        NotificationWidget(
          notification: notification,
        ),
      );
    }

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Header(text: 'Notifications'),
              const SizedBox(height: 4),
              notifications.isEmpty
                  ? const Text('No notifications')
                  : Column(children: notifications),
            ],
          ),
        ),
      ],
    );
  }
}
