import 'schedule_item.dart';
import 'user.dart';

class Schedule {
  Schedule({
    required this.id,
    required this.owner,
  });
  
  final String id;
  final User owner;
  final List<ScheduleItem> items = <ScheduleItem>[];

  void addItem(ScheduleItem entry) {
    items.any((e) => e.overlaps(entry))
        ? throw Exception('Schedule item overlaps with existing schedule item')
        : items.add(entry);
  }

  ScheduleItem? getCurrentItem() {
    final now = DateTime.now();
    for (final entry in items) {
      if (entry.begin.isBefore(now) && entry.end.isAfter(now)) {
        return entry;
      }
    }
    return null;
  }
}
