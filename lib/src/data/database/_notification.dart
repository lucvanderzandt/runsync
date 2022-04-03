part of data.database;

void populateNotifications(Database database) {
  database.notifications.put('1', Notification(
    id: '1',
    type: NotificationType.message,
    body: "I'm ready!",
    from: database.users.get('3'),
    createdAt: DateTime.now(),
  ));
  database.notifications.put('2', Notification(
    id: '2',
    type: NotificationType.system,
    body: 'Your run with Sarah starts in 2 minutes',
    createdAt: DateTime.now(),
  ));
}