import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopping/authentication/services/loginDialogue.dart';
import 'package:shopping/db/UserModel.dart';
import './common/theme_helper.dart';
import 'forgot_password_page.dart';
import 'registration_page.dart';
import 'services/login_interface.dart';
import 'services/shared_services.dart';
import 'widgets/header_widget.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final VoidCallback? callback;
  const LoginPage({Key? key, this.callback}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double _headerHeight = 130;
  final Key _formKey = GlobalKey<FormState>();
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
    // context = this.context;
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
                        const Text(
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
                                                  setState(() {
                                                    hidePassword =
                                                        !hidePassword;
                                                  });
                                                })),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 15.0),
                                // Container(
                                //   margin:
                                //       const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                //   alignment: Alignment.topRight,
                                //   child: GestureDetector(
                                //     onTap: () {
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const ForgotPasswordPage()),
                                //       );
                                //     },
                                //     child: const Text(
                                //       "Forgot your password?",
                                //       style: TextStyle(
                                //         color: Colors.grey,
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
                                    onPressed: () async{
                                      await signIn();
                                    },
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  //child: Text('Don\'t have an account? Create'),
                                  child: Text.rich(TextSpan(children: [
                                    const TextSpan(
                                        text: "Don\'t have an account? "),
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

  Future signIn() async {
    // String url = "https://product-mgt-api.herokuapp.com/api/login";

    if (_emailContoller.text.isNotEmpty && _passwordContoller.text.isNotEmpty) {
      UserModel? user = await _loginService.login(
          _emailContoller.text, _passwordContoller.text);

      if (user != null) {
        print("The user not found here! $user");
        Navigator.pushNamed(context, '/');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incorrect credentials'),
          ),
        );
      }
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      // final response = await http.post(Uri.parse(url), body: {
      //   'email': _emailContoller.text,
      //   'password': _passwordContoller.text,
      // });
      // print(response.statusCode);

      // if (response.statusCode == 201) {
      //   print(response.statusCode);
      //   final SharedPreferences sharedPreferences =
      //       await SharedPreferences.getInstance();
      //   sharedPreferences.setString('token', _emailContoller.text);
      //   print(response.body);

      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => ProfilePage()));
      // } else {
      //   print(response.body);
      //   ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(response.),
      //   ),
      // );
      // }
    }
    return 0;
  }


}
