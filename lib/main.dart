import 'package:flutter/material.dart';
import 'app/colors.dart';
import 'app/page/layout_page.dart';

void main() {
  runApp(const RunSync());
}

class RunSync extends StatelessWidget {
  const RunSync({Key? key}) : super(key: key);

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
}