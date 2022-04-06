import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping/NavScreens.dart';
import 'package:shopping/db/UserModel.dart';

import 'Screens/Home/Home.dart';
import 'authentication/profile_page.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  UserModel? user;

  // Future <Bool> isLogged(){
  //   if(user?.token != null){
  //     currentState= navigator.push(route)
  //   }
  // }

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/profile': (context) => ProfilePage(),
        '/home': (context) => NavigationScreens(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        backgroundColor: const Color(0xFFFFAFAFA),
        // primaryColor:const Color(0xFFFFBD00),
        primaryColor: Colors.teal,
        accentColor: Colors.teal,
      ),
      home: NavigationScreens(),
    );
  }
}
