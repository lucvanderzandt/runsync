import 'user.dart';

class Session {
  Session({
    required this.id,
    required this.created,
    this.user,
  });

  final String id;
  final DateTime created;
  User? user;

  bool get authenticated => user != null;
}
