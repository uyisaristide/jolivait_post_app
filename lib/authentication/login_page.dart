import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/db/UserModel.dart';
import './common/theme_helper.dart';

import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
import 'services/login_interface.dart';
import 'services/shared_services.dart';
import 'widgets/header_widget.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 130;
  Key _formKey = GlobalKey<FormState>();
  final _emailContoller = TextEditingController();
  final _passwordContoller = TextEditingController();

  bool hidePassword = true;

  final ILogin _loginService = LoginService();

  // late LoginRequestModel requestModel;

  // void initState() {
  //   super.initState();
  //   requestModel =  LoginRequestModel(email: _emailContoller.text, password: _passwordContoller.text);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true,
                    Icons.login_rounded), //let's create a common header widget
              ),
              SafeArea(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: const EdgeInsets.fromLTRB(
                        20, 10, 20, 10), // This will be the login form
                    child: Column(
                      children: [
                        // Text(
                        //   'Hello',
                        //   style: TextStyle(
                        //       fontSize: 60, fontWeight: FontWeight.bold),
                        // ),
                        Text(
                          'Signin into your account',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 30.0),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextField(
                                    controller: _emailContoller,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            'User Email', 'Enter your Email'),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 30.0),
                                Container(
                                  child: TextFormField(
                                    controller: _passwordContoller,
                                    obscureText: hidePassword,
                                    decoration:
                                        ThemeHelper().textInputDecoration(
                                            'Password',
                                            'Enter your password',
                                            IconButton(
                                                icon: Icon(Icons.visibility),
                                                onPressed: () {
                                                  setState(() {
                                                    hidePassword =
                                                        !hidePassword;
                                                  });
                                                })),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 15.0),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordPage()),
                                      );
                                    },
                                    child: Text(
                                      "Forgot your password?",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: ThemeHelper()
                                      .buttonBoxDecoration(context),
                                  child: ElevatedButton(
                                    style: ThemeHelper().buttonStyle(),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Text(
                                        'Sign In'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () async {
                                      print(LoginPage().runtimeType);
                                      signIn();
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(text: "Don\'t have an account? "),
                                    TextSpan(
                                      text: 'Create',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegistrationPage()));
                                        },
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ])),
                                ),
                              ],
                            )),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    // String url = "https://product-mgt-api.herokuapp.com/api/login";

    if (_emailContoller.text.isNotEmpty && _passwordContoller.text.isNotEmpty) {
      UserModel? user = await _loginService.login(
          _emailContoller.text, _passwordContoller.text);

      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
      }
      // else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(response.),
      //   ),
      // );
      // }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('required'),
        ),
      );
    }
  }
}
