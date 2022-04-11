import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopping/authentication/common/theme_helper.dart';
import 'package:shopping/authentication/forgot_password_page.dart';
import 'package:shopping/authentication/login_page.dart';
import 'package:shopping/authentication/profile_page.dart';
import 'package:shopping/authentication/registration_page.dart';

Future<bool> showLoginDialog(context) async {
  LoginPage login = new LoginPage();

  var hidePassword = true;
  var _formKey;
  var _passwordContoller = TextEditingController();
  var _emailContoller = TextEditingController();
  return await showDialog(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: AlertDialog(
        title: Text(
          'LOGIN TO CONTINUE',
          style: TextStyle(color: Colors.teal),
        ),
        content: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: TextField(
                    controller: _emailContoller,
                    decoration: ThemeHelper()
                        .textInputDecoration('User Email', 'Enter your Email'),
                  ),
                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                ),
                const SizedBox(height: 30.0),
                Container(
                  child: TextFormField(
                    controller: _passwordContoller,
                    obscureText: hidePassword,
                    decoration: ThemeHelper().textInputDecoration(
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
                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                ),
                const SizedBox(height: 15.0),
                Container(
                  decoration: ThemeHelper().buttonBoxDecoration(context),
                  child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          'Sign In'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        signIn();
                      }),
                ),
              ],
            )),
        actions: [
          TextButton(
              child: Text("CANCEL", style: TextStyle(color: Colors.teal)),
              onPressed: () {
                Navigator.pop(context, false);
              }),
        ],
      ),
    ),
  );
}

void signIn() {
}
