import '../../data/database/database.dart';
import '../../domain/entity/session.dart';
import '../../data/repository/base_mock_service.dart';

abstract class SessionService extends BaseMockService {
  SessionService({required Database database}) : super(database: database);

  Session getSession();
}
