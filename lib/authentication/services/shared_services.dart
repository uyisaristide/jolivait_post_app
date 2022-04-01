// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shopping/Models/login_model.dart';

// class sharedServices {
//   static Future<bool> isLoggedIn() async {
//     final prefs = await SharedPreferences.getInstance();

//     return prefs.getString('login_detail') != null ? true : false;
//   }

//   static Future<LoginResponseModel> loginDetails() async {
//     final prefs = await SharedPreferences.getInstance();

//     return prefs.getString('login_detail') != null
//         ? LoginResponseModel.fromJson(
//             jsonDecode(
//               prefs.getStringList('login_detail'),
//             ),
//           )
//         : null;
//   }

//   static Future<void> setLoginDetails(LoginResponseModel responseModel) async {
//     final prefs = await SharedPreferences.getInstance();

//     return prefs.getString(
//         'login_detail',
//         responseModel != null
//             ? jsonEncode(
//                 responseModel.toJson(),
//               )
//             : null);
//   }

//   static Future<void> logout(BuildContext context) async {
//     await setLoginDetails(null);
//     Navigator.of(context).pushReplacementNamed('/login');
//   }
// }
