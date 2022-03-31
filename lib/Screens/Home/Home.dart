import 'package:flutter/material.dart';
import 'package:shopping/Screens/Home/Widgets/BestSell.dart';
import 'package:shopping/Screens/Home/Widgets/Custom_App_Bar.dart';
import 'package:shopping/Screens/Home/Widgets/NewArrivals.dart';
import 'package:shopping/Screens/Home/Widgets/Search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [CustomAppBar(), SearchBar(), NewArrivals(), BestSell()],
      ),
    );
    // bottomNavigationBar: BottomNavigationBar(
    //   currentIndex: currentIndex,
    //   onTap: (index)=>setState(() {
    //     currentIndex = index;
    //   }),
    //   showSelectedLabels: false,
    //   showUnselectedLabels: false,
    //   type: BottomNavigationBarType.fixed,
    //   items: bottomList.map((e) =>
    //       BottomNavigationBarItem(
    //         icon: Image.asset('assets/icons/$e.png', width: 25,),
    //         label: e
    //       )
    //   ).toList(),
    //
    // ),
  }
}
