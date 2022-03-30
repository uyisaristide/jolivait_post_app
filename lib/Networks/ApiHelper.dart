import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping/Models/Products.dart';
class DatabaseHelper{
  final getUrl = 'https://jsonplaceholder.typicode.com/albums/1';
  Future fetchAlbum() async{
    final response = await http.get(Uri.parse(getUrl));
    if(response.statusCode == 200){

      return Products.fromJson(jsonDecode(response.body));
      
    }else if(response.statusCode == 401){

      print("Unauthenticated");
      return "You\'re not authenticated to see this";

    }else{
      throw "Failed to fetch data";
    }
  }

}