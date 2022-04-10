import '../../data/database/database.dart';
import '../../domain/entity/user.dart';
import '../../data/repository/base_mock_service.dart';

abstract class UserService extends BaseMockService {
  UserService({required Database database}) : super(database: database);

  User? getUser(String id);
  List<User> getFriends(User user);
}
