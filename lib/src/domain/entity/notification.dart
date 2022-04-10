import 'user.dart';

class Notification {
  Notification({
    required this.id,
    required this.type,
    required this.body,
    required this.createdAt,
    this.from,
    this.updatedAt,
  });

  final String id;
  final NotificationType type;
  final User? from;
  final String body;
  final DateTime createdAt;
  DateTime? updatedAt;

  String get message => from != null ? '${from!.name}: $body' : body;
}

enum NotificationType {
  message,
  system,
  other,
}
