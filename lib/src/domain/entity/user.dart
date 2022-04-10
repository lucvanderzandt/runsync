class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.friends = const [],
    this.online = false,
  });

  final String id;
  final String name;
  final String email;
  final List<String> friends;
  bool online;
  String? avatar;
  String? fitbitUserId;
}
