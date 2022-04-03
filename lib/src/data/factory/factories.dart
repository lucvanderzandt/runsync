part of data;

Database? _database;

Database get database => _database ??= populatedDatabase();

SessionService sessionServiceFactory() =>
    SessionServiceImpl(database: database);
    
NotificationService notificationServiceFactory() =>
    NotificationServiceImpl(database: database);

ScheduleService scheduleServiceFactory() =>
    ScheduleServiceImpl(database: database);

FitbitActivityTimeseriesDataManager fitbitActivityServiceFactory() =>
    FitbitActivityTimeseriesDataManager(
      clientID: Secrets.fitbitClientId,
      clientSecret: Secrets.fitbitClientSecret,
      type: 'distance',
    );
