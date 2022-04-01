import 'package:flutter/material.dart';

import '../../../Models/Products.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final suggestionsList = ['clothes', 'food', 'drinks'];

  // List<Products> productsList = Products.generateItems();

  @override
  Widget build(BuildContext context) {
    var _searchQuery = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: Column(children: [
        Row(children: [
          Flexible(
            flex: 1,
            child: TextField(
              controller: _searchQuery,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Make your search!",
                  hintStyle:
                      const TextStyle(color: Colors.grey, fontSize: 15.0),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      "assets/icons/search.png",
                      width: 20.0,
                    ),
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15.0)),
            child: Image.asset(
              "assets/icons/filter.png",
              width: 20,
              height: 20,
            ),
          )
        ]),
        // SizedBox(
        //     height: 100,
        //     child: ListView.builder(
        //
        //         itemBuilder: (context, index) {
        //       final productsSingle = productsList[index];
        //       return ListTile(
        //         leading: Image.asset(
        //           productsSingle.thumbnail,
        //           fit: BoxFit.cover,
        //           width: 50,
        //           height: 50,
        //         ),
        //         title: Text(productsSingle.names),
        //       );
        //     })),
        Row(
          children: suggestionsList
              .map((e) => Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.only(top: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Text(
                      e,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))
              .toList(),
        ),
      ]),
    );
  }

  // void searchProduct(String query) {
  //   final suggestions = productsList.where((element) {
  //     final productName = element.names.toLowerCase();
  //     final input = query.toLowerCase();
  //     return productName.contains(input);
  //   }).toList();
  //   setState(() => productsList = suggestions);
  // }
}
