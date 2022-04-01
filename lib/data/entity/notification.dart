class Notification {
  final String id;
  final String title;
  final String body;
  final DateTime createdAt;
  DateTime? updatedAt;

  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    this.updatedAt,
  });
}
