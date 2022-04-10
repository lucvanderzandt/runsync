import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entity/schedule_item.dart';
import '../../domain/repository/schedule_service.dart';
import 'header_widget.dart';
import 'schedule_item_widget.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  final ScheduleService _scheduleService = Get.find<ScheduleService>();

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];

    for (final item in _scheduleService.getSchedule()?.items ?? []) {
      items.add(
        ScheduleItemWidget(
          begin: item.begin,
          distance: item.distance,
          participants: item.participants,
        ),
      );
    }

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Header(text: 'Next scheduled runs'),
              const SizedBox(height: 4),
              items.isEmpty
                  ? const Text('No scheduled runs')
                  : Column(children: items),
            ],
          ),
        ),
      ],
    );
  }
}
