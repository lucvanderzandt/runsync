import 'package:flutter/material.dart';
import '../colors.dart';
import 'community_page.dart';
import 'exercise_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  final List<Widget> _pages = [
    const HomePage(),
    const ExercisePage(),
    const CommunityPage(),
    const ProfilePage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('RunSync'),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: RunSyncTheme.orange,
        unselectedItemColor: RunSyncTheme.darkBlue,
        onTap: _onMenuChange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'My Exercise',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );

  void _onMenuChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
