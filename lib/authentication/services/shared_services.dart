import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:shopping/authentication/services/login_interface.dart';
import 'package:shopping/db/UserModel.dart';

class LoginService extends ILogin {
  @override
  Future<UserModel?> login(String email, String password) async {
    final api = Uri.parse('https://product-mgt-api.herokuapp.com/api/login');
    final data = {"email": email, "password": password};
    
    http.Response response;
    response = await http.post(api, body: data);
    
    if (response.statusCode == 201) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      await storage.setString('TOKEN', body['token']);
      await storage.setString('EMAIL', email);
      return UserModel(email: email, token: body['token']);
    } else if(response.statusCode !=201) {

      final errorResponse = jsonDecode(response.body);
    final errorMessage = errorResponse['message'];

      print(errorMessage);
    }
    
  } 

  @override
  Future<UserModel?> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      return UserModel(email: email, token: token);
    } else {
      return null;
    }
  }

  @override
  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final email = storage.getString('EMAIL');
    final token = storage.getString('TOKEN');
    if (email != null && token != null) {
      await storage.remove('TOKEN');
      await storage.remove('EMAIL');
      return true;
    } else {
      return false;
    }
  }
}
