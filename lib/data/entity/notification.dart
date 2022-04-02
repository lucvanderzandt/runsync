class Notification {
  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String title;
  final String body;
  final DateTime createdAt;
  DateTime? updatedAt;
}
