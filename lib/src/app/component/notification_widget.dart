import 'package:flutter/material.dart' hide Notification;

import '../../domain/entity/notification.dart';
import '../colors.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({required this.notification, Key? key})
      : super(key: key);

  final Notification notification;

  @override
  Widget build(BuildContext context) {
    final element = <Widget>[Text(notification.message)];

    if (notification.type == NotificationType.message) {
      element.add(
        const Icon(Icons.chevron_right, color: RunSyncTheme.orange),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: 45,
      decoration: BoxDecoration(
        color: RunSyncTheme.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: element,
      ),
    );
  }
}
