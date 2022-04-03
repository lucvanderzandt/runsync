part of data.database;

void populateSchedule(Database database) {
  database.schedules
    ..put(
      'a',
      Schedule(id: 'a', owner: database.users.get('1')!),
    )
    ..put(
      'b',
      Schedule(id: 'b', owner: database.users.get('2')!),
    );

  database.schedules.get('a')!.items
    ..add(
      ScheduleItem(
          id: 'a1',
          begin: DateTime.now().add(const Duration(hours: 1)),
          end: DateTime.now().add(const Duration(hours: 2)),
          distance: 10,
          participants: [database.users.get('3')!]),
    )
    ..add(ScheduleItem(
        id: 'a2',
        begin: DateTime.now().add(const Duration(days: 2)),
        end: DateTime.now().add(const Duration(days: 2, hours: 2)),
        distance: 20,
        participants: [database.users.get('2')!]));
}
