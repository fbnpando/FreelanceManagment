import 'package:flutter/material.dart';
import 'package:gestion_freelance/screens/Login.dart';
import 'package:gestion_freelance/screens/control/1.dart';
import 'package:gestion_freelance/screens/home2.dart';
import 'package:gestion_freelance/screens/home_screen.dart';
import 'package:gestion_freelance/screens/profile.dart';
import 'package:gestion_freelance/widgets/HomeBottomNavbar.dart';
import 'package:gestion_freelance/screens/money.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions() {
    return [HomePage(), const HomeScreen(), const Money(), ProfilePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      bottomNavigationBar: HomeBottomNavBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
