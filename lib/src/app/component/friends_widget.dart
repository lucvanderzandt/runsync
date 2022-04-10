import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/repository/session_service.dart';
import '../../domain/repository/user_service.dart';
import 'header_widget.dart';

class FriendsWidget extends StatefulWidget {
  const FriendsWidget({Key? key}) : super(key: key);

  @override
  _FriendsWidgetState createState() => _FriendsWidgetState();
}

class _FriendsWidgetState extends State<FriendsWidget> {
  final SessionService _sessionService = Get.find<SessionService>();
  final UserService _userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    final user = _sessionService.getSession().user;
    final friends = _userService.getFriends(user!);

    final avatars = <Widget>[];

    for (final friend in friends) {
      avatars.add(
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage(friend.avatar ?? 'assets/images/fallback.png'),
            ),

            Positioned(
              top: 80,
              left: 80,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: friend.online ? Colors.green : Colors.red.shade400,
                  borderRadius: BorderRadius.circular(7.5),
                ),
              ),
            ),
          ],
        ),
      );
      if (friend != friends.last) {
        avatars.add(
          const SizedBox(
            width: 10,
          ),
        );
      }
    }

    return Column(
      children: [
        Row(
          children: const [
            Header(
              text: 'Friends',
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: avatars,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
