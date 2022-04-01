import 'package:flutter/material.dart';
import '../colors.dart';

/// A widget that displays user notifications.
class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 50,
            child: Text(
              'Notifications',
              style: TextStyle(
                color: RunSyncTheme.darkBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
