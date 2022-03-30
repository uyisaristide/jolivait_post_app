import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/NavScreens.dart';

import 'Screens/Home/Home.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        backgroundColor: const Color(0xFFFFAFAFA),
        primaryColor:const Color(0xFFFFBD00),
        accentColor: const Color(0xFFFFEBC7),
      ),
      home: NavigationScreens(),
    );
  }
}
