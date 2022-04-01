// String? token;
//   @override
//   void initState() {
//     isLogged().whenComplete(() async {
//       await token == null
//           ? Navigator.pushNamed(context, '/')
//           : Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => ProfilePage()));
//     });

//     super.initState();
//   }

//   @override
//   Future isLogged() async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     var obtainToken = sharedPreferences.getString('token');

//     setState(() {
//       token = obtainToken;
//     });
//     print(token);
//   }
