import 'package:flutter/material.dart';
import '../colors.dart';

class Header extends StatelessWidget {
  const Header({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) => Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: RunSyncTheme.darkBlue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
}
