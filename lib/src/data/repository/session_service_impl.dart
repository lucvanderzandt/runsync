part of data;

class SessionServiceImpl extends SessionService {
  SessionServiceImpl({required Database database}) : super(database: database);

  @override
  Session getSession() => database.sessions.first ?? Session(id: 'a', created: DateTime.now());
}