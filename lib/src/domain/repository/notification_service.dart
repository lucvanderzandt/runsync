import '../../data/database/database.dart';
import '../../domain/entity/notification.dart';
import '../../data/repository/base_mock_service.dart';

abstract class NotificationService extends BaseMockService {
  NotificationService({required Database database}) : super(database: database);

  Notification? getNotification(String id);
  List<Notification> getNotifications();
  void createNotification(Notification notification);
  void updateNotification(Notification notification);
  void deleteNotification(String id);
}