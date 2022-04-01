import 'package:flutter/material.dart';
import 'package:runsyc/app/colors.dart';

import 'app/page/home_page.dart';

void main() {
  runApp(const RunSync());
}

class RunSync extends StatelessWidget {
  const RunSync({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RunSync',
      theme: ThemeData(
        backgroundColor: RunSyncTheme.white,
        primaryColor: RunSyncTheme.orange,
        appBarTheme: const AppBarTheme(
          backgroundColor: RunSyncTheme.white,
          foregroundColor: RunSyncTheme.darkBlue,
        ),
      ),
      home: const HomePage(title: 'RunSync - Home'),
    );
  }
}