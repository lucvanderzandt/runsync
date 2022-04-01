import '../../domain/repository/session_service.dart';
import '../database.dart';
import '../entity/session.dart';

class SessionServiceImpl extends SessionService {
  SessionServiceImpl({required Database database}) : super(database: database);

  @override
  Session getSession() => database.sessions.first ?? Session(id: 'a', created: DateTime.now());
}