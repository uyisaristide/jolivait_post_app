// class UserModel {
//   int id;
//   String token;
//   String name;
//   String email;
//   String password;

//   UserModel(
//       {required this.id,
//       required this.token,
//       required this.name,
//       required this.email,
//       required this.password});

//     factory UserModel.fromJson( Map<String, dynamic> fromJson){
//         return UserModel(
//         id: fromJson['id'],
//         token: fromJson['token'],
//         name: fromJson['name'],
//         password: fromJson['password'],
//         email: fromJson['email']
//     );
// }  
// }

import 'package:flutter/material.dart';

class UserModel {
  final String email;
  final String token;

  UserModel({required this.email, required this.token});
}
