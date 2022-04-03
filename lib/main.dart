import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/app/colors.dart';
import 'src/app/page/layout_page.dart';
import 'src/data/data.dart';

void main() {
  runApp(RunSync());
}

class RunSync extends StatelessWidget {
  RunSync({Key? key}) : super(key: key) {
    _injectServices();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'RunSync',
      theme: ThemeData(
        backgroundColor: RunSyncTheme.white,
        primaryColor: RunSyncTheme.orange,
        appBarTheme: const AppBarTheme(
          backgroundColor: RunSyncTheme.white,
          foregroundColor: RunSyncTheme.darkBlue,
        ),
      ),
      home: const LayoutPage(),
    );

  void _injectServices() {
    Get
      ..put(sessionServiceFactory())
      ..put(notificationServiceFactory())
      ..put(scheduleServiceFactory())
      ..put(fitbitActivityServiceFactory());
  }
}