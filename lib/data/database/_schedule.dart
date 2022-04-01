part of data.database;

void populateSchedule(Database database) {
  database.schedules
  ..put('a', Schedule(id: 'a', owner: database.users.get('1')!))
  ..put('b', Schedule(id: 'b', owner: database.users.get('2')!));
}