import '../database.dart';

abstract class BaseMockService {
  BaseMockService({required this.database, this.delayDuration});

  final Database database;
  final Duration? delayDuration;

  /// Waits for a preconfigured period of time. If no delay has been configured,
  /// this method returns immediately.
  Future<void> delay() async {
    if (delayDuration == null) {
      return Future<void>.value();
    } else {
      return Future.delayed(delayDuration!);
    }
  }
}