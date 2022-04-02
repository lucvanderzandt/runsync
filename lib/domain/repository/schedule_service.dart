import '../../data/database.dart';
import '../../data/entity/schedule.dart';
import '../../data/repository/base_mock_service.dart';

abstract class ScheduleService extends BaseMockService {
  ScheduleService({required Database database}) : super(database: database);

  Schedule? getSchedule();
  void createSchedule(Schedule schedule);
  void updateSchedule(Schedule schedule);
  void deleteSchedule(String id);
}