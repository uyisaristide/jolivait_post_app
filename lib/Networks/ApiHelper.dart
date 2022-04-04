import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Models/Products.dart';
const String url = "https://product-mgt-api.herokuapp.com/api/product";

List<Products> parseProduct(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var users = list.map((e) => Products.fromJson(e)).toList();
  return users;
}

Future<List<Products>> products() async{
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parseProduct,response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:shopping/Models/Products.dart';
// class DatabaseHelper{
//   final getUrl = 'https://jsonplaceholder.typicode.com/albums/1';
//   Future fetchAlbum() async{
//     final response = await http.get(Uri.parse(getUrl));
//     if(response.statusCode == 200){
//
//       return Products.fromJson(jsonDecode(response.body));
//
//     }else if(response.statusCode == 401){
//
//       print("Unauthenticated");
//       return "You\'re not authenticated to see this";
//
//     }else{
//       throw "Failed to fetch data";
//     }
//   }
//
// }
