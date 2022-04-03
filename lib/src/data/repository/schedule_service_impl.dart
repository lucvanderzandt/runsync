import 'package:get/get.dart';

import '../../domain/repository/schedule_service.dart';
import '../../domain/repository/session_service.dart';
import '../database/database.dart';
import '../entity/schedule.dart';

class ScheduleServiceImpl extends ScheduleService {
  ScheduleServiceImpl({required Database database}) : super(database: database);

  final SessionService _sessionService = Get.find<SessionService>();

  @override
  Schedule? getSchedule() => database.schedules.getWhere(
      (schedule) => schedule.owner.id == _sessionService.getSession().user?.id);

  @override
  void createSchedule(Schedule schedule) =>
      database.schedules.put(schedule.id, schedule);

  @override
  void deleteSchedule(String id) => database.schedules.delete(id);

  @override
  void updateSchedule(Schedule schedule) =>
      database.schedules.put(schedule.id, schedule);
}
