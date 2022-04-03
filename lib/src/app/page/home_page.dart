import 'package:flutter/material.dart';
import '../colors.dart';
import '../component/notifications_widget.dart';
import '../component/schedule_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(child: 
            Text('RunSync')
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          color: RunSyncTheme.white,
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              NotificationsWidget(),
              SizedBox(height: 21),
              ScheduleWidget(),
            ],
          ),
        ),
      );
}
