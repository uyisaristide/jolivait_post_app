import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/Screens/Home/Home.dart';
import 'package:shopping/Screens/Menu/MenuScreen.dart';
import 'package:shopping/Screens/Profile/Profile.dart';
import 'package:shopping/Screens/WishList/WishList.dart';

import 'Screens/Cart/CartScreen.dart';

class NavigationScreens extends StatefulWidget {
  @override
  State<NavigationScreens> createState() => _NavigationScreensState();
}

class _NavigationScreensState extends State<NavigationScreens> {
  late var finalToken;
  late var username;

  @override
  void initState() {
    authStatus().whenComplete(() async {
      if (finalToken != null) {
        Navigator.pushNamed(context, '/profile');
      } else {
        setState(() {});
      }
    });

    super.initState();
  }

  Future authStatus() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var currentToken = sharedPreferences.getString("TOKEN");
    setState(() {
      finalToken = currentToken;
    });
    print(finalToken);
  }

  int currentIndex = 0;
  final bottomList = ["home", "menu", "user"];
  final screens = [
    const HomePage(),
    const MenuScreen(),
    Cart(),
    WishList(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: Theme.of(context).primaryColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
            BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wish List"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
