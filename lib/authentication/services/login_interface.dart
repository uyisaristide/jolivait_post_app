import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../db/UserModel.dart';

abstract class ILogin {
  Future<UserModel?> login(String email, String password) async {
    final api = 'https://product-mgt-api.herokuapp.com/api/login';
    final data = {"email": email, "password": password};
    final dio = Dio();
    Response response;
    response =
        await dio.post(api, data: data).timeout(const Duration(seconds: 20));
    if (response.statusCode == 200) {
      final body = response.data;
      return UserModel(email: email, token: body['token']);
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Future<UserModel?> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      return UserModel(email: email, token: token);
    } 
    
  }

  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return true;
  }
}
