import 'package:runsyc/data/database.dart';

import '../../domain/repository/notification_service.dart';
import '../entity/notification.dart';

class NotificationServiceImpl extends NotificationService {
  NotificationServiceImpl({required Database database})
      : super(database: database);

  @override
  Notification? getNotification(String id) => database.notifications.get(id);

  @override
  List<Notification> getNotifications() => database.notifications.getAll();

  @override
  void createNotification(Notification notification) =>
      database.notifications.put(notification.id, notification);

  @override
  void updateNotification(Notification notification) =>
      database.notifications.put(notification.id, notification);

  @override
  void deleteNotification(String id) => database.notifications.delete(id);
}
