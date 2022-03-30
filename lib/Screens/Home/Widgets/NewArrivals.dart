import 'dart:convert';

import 'package:flutter/material.dart';
import 'CategoryList.dart';
import 'package:http/http.dart' as http;

import 'ItemsWidget.dart';

class NewArrivals extends StatefulWidget {
  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  dynamic productsList = [];

  final getUrl = 'http://product-mgt-api.herokuapp.com/api/product';

  Future fetchProduct() async{

    try{
      final response = await http.get(Uri.parse(getUrl));
      if(response.statusCode == 200){
        // print(response.body);
        final responseProducts = jsonDecode(response.body) as List;
        setState(() {
          productsList = responseProducts;
        });
      }else if(response.statusCode == 401){
        print(response.body);
        print("Unauthenticated");
        return "You\'re not authenticated to see this";
      }else{
        throw "Failed to fetch data";
      }
    }catch(error){
      throw error;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CategoryList(
          title: 'New items',
        ),
        Container(
            child: SizedBox(
          height: 250,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Items(productsList[index]),
              separatorBuilder: (_, index) => const SizedBox(
                    width: 5.0,
                  ),
              itemCount: productsList.length),
        )),
      ],
    ));
  }
}