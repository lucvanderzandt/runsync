part of data.database;

void populateSessions(Database database) {
  database.sessions.put(
      'a',
      Session(
        id: 'a',
        created: DateTime.now(),
        user: database.users.get('1'),
      ));
}