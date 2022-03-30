import 'package:flutter/material.dart';
import 'package:shopping/Screens/Menu/Widgets/MenuItems.dart';

import '../Home/Widgets/BestSell.dart';
import '../Home/Widgets/Custom_App_Bar.dart';
import '../Home/Widgets/Search.dart';
class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(),
          MenuItems()
        ],
      ),
    );
  }
}
