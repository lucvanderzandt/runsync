import 'package:runsyc/data/database.dart';
import 'package:runsyc/data/repository/base_mock_service.dart';

import '../../data/entity/schedule.dart';

abstract class ScheduleService extends BaseMockService {
  ScheduleService({required Database database}) : super(database: database);

  Schedule? getSchedule();
  void createSchedule(Schedule schedule);
  void updateSchedule(Schedule schedule);
  void deleteSchedule(String id);
}