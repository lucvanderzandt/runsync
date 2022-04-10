import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/user.dart';
import '../colors.dart';

class ScheduleItemWidget extends StatelessWidget {
  const ScheduleItemWidget({
    required this.begin,
    required this.distance,
    required this.participants,
    Key? key,
  }) : super(key: key);

  final DateTime begin;
  final double distance;
  final List<User> participants;

  @override
  Widget build(BuildContext context) {
    final minutesToStart = begin.difference(DateTime.now()).inMinutes;
    String duration;

    if (minutesToStart < 60) {
      duration = '$minutesToStart min. remain';
    } else {
      duration = DateFormat('MMM d - HH:mm').format(begin);
    }

    final decoration = BoxDecoration(
      color: RunSyncTheme.white,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 4,
          offset: const Offset(0, 4),
        ),
      ],
    );

    final children = <Widget>[
      Container(
        decoration: decoration,
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Text(
          duration,
        ),
      ),
      Container(
        decoration: decoration,
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Text(
          '$distance km',
        ),
      ),
      Container(
        decoration: decoration,
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Text(
          participants.map((p) => p.name).join(', '),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ];

    if (minutesToStart < 60) {
      children.add(
        InkWell(
          onTap: () => showDialog(context: context, builder: _buildStartDialog),
          child: Container(
            width: 60,
            decoration: BoxDecoration(
              color: RunSyncTheme.orange,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: const Text(
              'Start',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    } else {
      children.add(
        Container(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            width: 60,
            child: const SizedBox()),
      );
    }

    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

  Widget _buildStartDialog(BuildContext context) => AlertDialog(
        title: const Text('Listen to music together'),
        content: SizedBox(
          width: 180,
          height: 180,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _openSpotify,
                style: _getStyle(RunSyncTheme.orange),
                child: const Text('Open Spotify'),
              )
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: _getStyle(RunSyncTheme.gray),
            child: const Text('No, thanks!'),
          ),
          ElevatedButton(
            onPressed: () => null,
            style: _getStyle(RunSyncTheme.orange),
            child: const Text('Done'),
          ),
        ],
      );

  ButtonStyle _getStyle(Color color) => ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );

  Future<void> _openSpotify() async {
    await LaunchApp.openApp(
      androidPackageName: 'com.spotify.music',
      iosUrlScheme: 'spotify://',
    );
  }

  
}
