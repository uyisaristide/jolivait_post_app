import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../authentication/common/theme_helper.dart';
import '../../authentication/forgot_password_page.dart';
import '../../authentication/profile_page.dart';
import '../../authentication/registration_page.dart';
import '../../authentication/widgets/header_widget.dart';
import './../../authentication/splash_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
              children: [
                Container(
                  height: _headerHeight,
                  child: HeaderWidget(_headerHeight, true,
                      Icons.login_rounded), //let's create a common header widget
                ),
                SafeArea(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      margin: EdgeInsets.fromLTRB(
                          20, 10, 20, 10), // This will be the login form
                      child: Column(
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                                fontSize: 60, fontWeight: FontWeight.bold),
                          ),
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
                                      decoration: ThemeHelper()
                                          .textInputDecoration('User Name',
                                              'Enter your user name'),
                                    ),
                                    decoration:
                                        ThemeHelper().inputBoxDecorationShaddow(),
                                  ),
                                  SizedBox(height: 30.0),
                                  Container(
                                    child: TextField(
                                      obscureText: true,
                                      decoration: ThemeHelper()
                                          .textInputDecoration(
                                              'Password', 'Enter your password'),
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
                                      onPressed: () {
                                        //After successful login we will redirect to profile page. Let's create profile page now
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage()));
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                    //child: Text('Don\'t have an account? Create'),
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
                      )
                      ),
                ),
              ],
            ), 
      ),
    );
  }
}
