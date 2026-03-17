import 'package:flutter/material.dart';
import 'package:nti_final_project/core/style/app_colors.dart';
import '../../../settings/presentation/view/settings-view.dart';
import '../../../task/presentation/views/calender_view.dart';
import '../../../task/presentation/views/task_view.dart';
import 'home_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      const HomeBody(),
       const TaskScreenBody(),
      const CalenderScreenBody(),
      const SettingScreen(),
    ];


    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: AppColors.primaryBlue,
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.toc_outlined), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      body: pages[_selectedIndex],
    );
  }
}


