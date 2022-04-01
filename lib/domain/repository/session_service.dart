import '../../data/repository/base_mock_service.dart';

import '../../data/database.dart';
import '../../data/entity/session.dart';

abstract class SessionService extends BaseMockService {
  SessionService({required Database database}) : super(database: database);

  Session getSession();
}
