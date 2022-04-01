part of data.database;

void populateUsers(Database database) {
  database.users
    ..put(
      '1',
      User(
        id: '1',
        name: 'Bob',
        email: 'bob@test.com',
      ),
    )
    ..put(
      '2',
      User(
        id: '2',
        name: 'Alice',
        email: 'alice@test.com',
      ),
    );
}
