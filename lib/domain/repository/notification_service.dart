import 'package:runsyc/data/database.dart';
import 'package:runsyc/data/repository/base_mock_service.dart';

import '../../data/entity/notification.dart';

abstract class NotificationService extends BaseMockService {
  NotificationService({required Database database}) : super(database: database);

  Notification? getNotification(String id);
  List<Notification>? getNotifications();
  void createNotification(Notification notification);
  void updateNotification(Notification notification);
  void deleteNotification(String id);
}