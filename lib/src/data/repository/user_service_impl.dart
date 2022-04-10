part of data;

class UserServiceImpl extends UserService {
  UserServiceImpl({required Database database}) : super(database: database);

  @override
  User? getUser(String id) => database.users.get(id);

  @override
  List<User> getFriends(User user) =>
      user.friends.map((id) => database.users.get(id)!).toList();
}
