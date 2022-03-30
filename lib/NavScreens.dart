import 'package:flutter/material.dart';
import 'package:shopping/Screens/Home/Home.dart';
import 'package:shopping/Screens/Menu/MenuScreen.dart';
import 'package:shopping/Screens/Profile/Profile.dart';

class NavigationScreens extends StatefulWidget {
  @override
  State<NavigationScreens> createState() => _NavigationScreensState();
}

class _NavigationScreensState extends State<NavigationScreens> {
  int currentIndex = 0;
  final bottomList = ["home", "menu", "heart", "user"];
  final screens = [
    const HomePage(),
    const MenuScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type:BottomNavigationBarType.fixed,
        items: bottomList
            .map((e) =>
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/$e.png", width: 25,), label: e))
            .toList(),
      ),
    );
  }
}
