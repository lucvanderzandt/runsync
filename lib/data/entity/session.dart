import 'user.dart';

class Session {
  final String id;
  final DateTime created;
  User? user;

  Session({
    required this.id,
    required this.created,
    this.user,
  });

  bool get authenticated => user != null;
}
