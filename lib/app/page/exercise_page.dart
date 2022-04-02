import 'package:flutter/material.dart';
import '../component/header_widget.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) => Column(
      children: const <Widget>[
        Header(text: 'My Exercise'),
      ],
    );
}
