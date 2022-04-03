library data.database;

import '../entity/notification.dart';
import '../entity/schedule.dart';
import '../entity/schedule_item.dart';
import '../entity/session.dart';
import '../entity/user.dart';
import '_table.dart';

part '_database.dart';
part '_notification.dart';
part '_schedule.dart';
part '_session.dart';
part '_user.dart';

Database populatedDatabase() {
  final database = Database();

  populateUsers(database);
  populateSessions(database);
  populateNotifications(database);
  populateSchedule(database);

  return database;
}
