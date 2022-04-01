part of data.database;

void populateNotifications(Database database) {
  database.notifications.put('1', Notification(
    id: '1',
    title: 'Notification 1',
    body: 'This is the body of notification 1',
    createdAt: DateTime.now(),
  ));
  database.notifications.put('2', Notification(
    id: '2',
    title: 'Notification 2',
    body: 'This is the body of notification 2',
    createdAt: DateTime.now(),
  ));
  database.notifications.put('3', Notification(
    id: '3',
    title: 'Notification 3',
    body: 'This is the body of notification 3',
    createdAt: DateTime.now(),
  ));
}