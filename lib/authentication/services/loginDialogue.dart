import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopping/authentication/common/theme_helper.dart';
import 'package:shopping/authentication/forgot_password_page.dart';
import 'package:shopping/authentication/login_page.dart';
import 'package:shopping/authentication/registration_page.dart';

Future<bool> showLoginDialog(context) async {
    
    var hidePassword= true;
    var _formKey;
    var _passwordContoller= TextEditingController();
    var _emailContoller = TextEditingController();
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('LOGIN FIRST'),
        content: Form(
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
                                const SizedBox(height: 30.0),
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
                                                  // setState(() {
                                                  //   hidePassword =
                                                  //       !hidePassword;
                                                  // });
                                                })),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 15.0),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgotPasswordPage()),
                                      );
                                    },
                                    child: const Text(
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
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 10, 40, 10),
                                      child: Text(
                                        'Sign In'.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () async {
                                      print(LoginPage().runtimeType);
                                      // signIn();
                                      showLoginDialog(context);
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
        actions: [
          TextButton(
              child: Text("no", style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.pop(context, false);
              }),
          TextButton(
              child: Text("yes!", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.pop(context, true);
              })
        ],
      ),
    );
  }

