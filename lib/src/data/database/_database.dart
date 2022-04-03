part of data.database;

class Database {
  final notifications = Table<Notification>();
  final schedules = Table<Schedule>();
  final users = Table<User>();
  final sessions = Table<Session>();
}
