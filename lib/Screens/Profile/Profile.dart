import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shopping/authentication/login_page.dart';
import '../../authentication/profile_page.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback? callback;

  const ProfileScreen({Key? key, this.callback}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String loggedToken;
  var currentToken;
  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    authStatus();
  }

  Future authStatus() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? tokens = sharedPreferences.getString("TOKEN");
    return tokens;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authStatus(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return LoginPage();
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          if (snapshot.hasData) {
            // print("This is the data found ${snapshot.data}");
            return const ProfilePage();
          } else if(!snapshot.hasData){
            print("This is the error ${snapshot.error}");
            return LoginPage();
          }else{
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
        });

    // return loggedToken.isNotEmpty
    //     ? ProfilePage(
    //         callback: () => setState(() {
    //           Navigator.pop(context);
    //         }),
    //       )
    //     : LoginPage(callback: () {
    //         setState(() {
    //           Navigator.pop(context);
    //         });
    //       });
    if (loggedToken.isNotEmpty) {
    } else {
      return LoginPage(
        callback: widget.callback,
      );
    }
    // return SingleChildScrollView(
    //   child: SafeArea(
    //     child: Column(
    //       children: [
    //         Container(
    //           height: _headerHeight,
    //           child: HeaderWidget(_headerHeight, true,
    //               Icons.login_rounded), //let's create a common header widget
    //         ),
    //         SafeArea(
    //           child: Container(
    //               padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    //               margin: EdgeInsets.fromLTRB(
    //                   20, 10, 20, 10), // This will be the login form
    //               child: Column(
    //                 children: [
    //                   Text(
    //                     'Hello',
    //                     style: TextStyle(
    //                         fontSize: 60, fontWeight: FontWeight.bold),
    //                   ),
    //                   Text(
    //                     'Signin into your account',
    //                     style: TextStyle(color: Colors.grey),
    //                   ),
    //                   SizedBox(height: 30.0),
    //                   Form(
    //                       key: _formKey,
    //                       child: Column(
    //                         children: [
    //                           Container(
    //                             child: TextField(
    //                               decoration: ThemeHelper().textInputDecoration(
    //                                   'User Name', 'Enter your user name'),
    //                             ),
    //                             decoration:
    //                                 ThemeHelper().inputBoxDecorationShaddow(),
    //                           ),
    //                           SizedBox(height: 30.0),
    //                           Container(
    //                             child: TextField(
    //                               obscureText: true,
    //                               decoration: ThemeHelper().textInputDecoration(
    //                                   'Password', 'Enter your password'),
    //                             ),
    //                             decoration:
    //                                 ThemeHelper().inputBoxDecorationShaddow(),
    //                           ),
    //                           SizedBox(height: 15.0),
    //                           Container(
    //                             margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
    //                             alignment: Alignment.topRight,
    //                             child: GestureDetector(
    //                               onTap: () {
    //                                 Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                       builder: (context) =>
    //                                           ForgotPasswordPage()),
    //                                 );
    //                               },
    //                               child: Text(
    //                                 "Forgot your password?",
    //                                 style: TextStyle(
    //                                   color: Colors.grey,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           Container(
    //                             decoration:
    //                                 ThemeHelper().buttonBoxDecoration(context),
    //                             child: ElevatedButton(
    //                               style: ThemeHelper().buttonStyle(),
    //                               child: Padding(
    //                                 padding:
    //                                     EdgeInsets.fromLTRB(40, 10, 40, 10),
    //                                 child: Text(
    //                                   'Sign In'.toUpperCase(),
    //                                   style: TextStyle(
    //                                       fontSize: 20,
    //                                       fontWeight: FontWeight.bold,
    //                                       color: Colors.white),
    //                                 ),
    //                               ),
    //                               onPressed: () {
    //                                 //After successful login we will redirect to profile page. Let's create profile page now
    //                                 Navigator.pushReplacement(
    //                                     context,
    //                                     MaterialPageRoute(
    //                                         builder: (context) =>
    //                                             ProfilePage()));
    //                               },
    //                             ),
    //                           ),
    //                           Container(
    //                             margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
    //                             //child: Text('Don\'t have an account? Create'),
    //                             child: Text.rich(TextSpan(children: [
    //                               TextSpan(text: "Don\'t have an account? "),
    //                               TextSpan(
    //                                 text: 'Create',
    //                                 recognizer: TapGestureRecognizer()
    //                                   ..onTap = () {
    //                                     Navigator.push(
    //                                         context,
    //                                         MaterialPageRoute(
    //                                             builder: (context) =>
    //                                                 RegistrationPage()));
    //                                   },
    //                                 style: TextStyle(
    //                                     fontWeight: FontWeight.bold,
    //                                     color: Theme.of(context).accentColor),
    //                               ),
    //                             ])),
    //                           ),
    //                         ],
    //                       )),
    //                 ],
    //               )),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
