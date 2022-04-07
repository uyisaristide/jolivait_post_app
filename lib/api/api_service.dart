// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:shopping/Models/login_model.dart';
//
// class apiService {
//   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
//     String url = "http://product-mgt-api.herokuapp.com/api/docs/api/login";
//
//     final response =
//         await http.post(Uri.parse(url), body: requestModel.toJson());
//
//     if (response.statusCode == 201 || response.statusCode == 400) {
//       return LoginResponseModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception("auth failed");
//     }
//   }
// }
