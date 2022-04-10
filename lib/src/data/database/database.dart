library data.database;

import '../../domain/entity/notification.dart';
import '../../domain/entity/schedule.dart';
import '../../domain/entity/schedule_item.dart';
import '../../domain/entity/session.dart';
import '../../domain/entity/user.dart';
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
