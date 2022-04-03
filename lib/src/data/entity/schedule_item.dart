import 'user.dart';

class ScheduleItem {
  ScheduleItem({
    required this.id,
    required this.begin,
    required this.end,
    required this.distance,
    required this.participants,
  });

  final String id;
  final DateTime begin;
  final DateTime end;
  final double distance;
  final List<User> participants;

  bool overlaps(ScheduleItem other) => begin.isBefore(other.end) && end.isAfter(other.begin);
}
