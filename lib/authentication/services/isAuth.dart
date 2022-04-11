import 'package:shared_preferences/shared_preferences.dart';

Future isAuth() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  var Token = sharedPreferences.getString("TOKEN");
  if (Token != null) {
    return true;
  }
}
