import 'package:flutter/material.dart';
import '../component/header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) => Column(
      children: const <Widget>[
        Header(text: 'My Profile'),
      ],
    );
}
