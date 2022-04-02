import '../../domain/repository/notification_service.dart';
import '../../domain/repository/session_service.dart';
import '../database.dart';
import '../repository/notification_service_impl.dart';
import '../repository/session_service_impl.dart';

class MockServiceFactory {
  MockServiceFactory(
    this._database,
  );

  final Database _database;

  NotificationService createNotificationService() =>
    NotificationServiceImpl(
      database: _database,
    );

  SessionService createSessionService() => SessionServiceImpl(
    database: _database,
  );
}