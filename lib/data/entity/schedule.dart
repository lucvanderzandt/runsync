import 'schedule_item.dart';
import 'user.dart';

class Schedule {
  final String id;
  final User owner;
  final List<ScheduleItem> entries = <ScheduleItem>[];

  Schedule({
    required this.id,
    required this.owner,
  });

  void addItem(ScheduleItem entry) {
    entries.any((e) => e.overlaps(entry))
      ? throw Exception('Schedule item overlaps with existing schedule item')
      : entries.add(entry);
  }

  ScheduleItem? getCurrentItem() {
    final now = DateTime.now();
    for (final entry in entries) {
      if (entry.begin.isBefore(now) && entry.end.isAfter(now)) {
        return entry;
      }
    }
    return null;
  }
}
