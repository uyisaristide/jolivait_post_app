import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopping/Screens/Home/Widgets/Search.dart';
import 'package:shopping/Screens/Menu/Widgets/ItemCard.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/db/DatabaseHelper.dart';
import '../../../Models/Products.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  // final productsList = Products.generateItems();
  var productsList = <Products>[];
  dynamic errors = const CircularProgressIndicator(
    color: Colors.teal,
  );

  void fetchMenu() async {
    try {
      final responses = await http
          .get(Uri.parse('https://product-mgt-api.herokuapp.com/api/product'))
          .timeout(const Duration(seconds: 20));
      if (responses.statusCode == 200) {
        final mapping = (jsonDecode(responses.body) as Iterable)
            .map((e) => Products.fromJson(e))
            .toList();
        setState(() {
          productsList = mapping;
        });
      } else if (responses.statusCode == 401) {
        const Text("Products unavailable");
      }
    } on TimeoutException catch (_) {
      setState(() {
        errors = const Text("Time out error, tap to retry!");
      });
      throw TimeoutException("Timeout");
    } on SocketException catch (error) {
      setState(() {
        errors = const Text("Turn on Wifi, tap to retry!");
      });
      throw "Message for error: $error Network exception";
    } catch (e) {
      const Text("Network error found");
      throw Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15),
            child: Center(
              child: Text(
                "All products",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          productsList.isEmpty
              ? Center(
                  child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: errors,
                  ),
                  onTap: () {
                    // print("Printed successfully");
                    setState(() {
                      // Navigator.pushNamed(context, '/');
                    });
                  },
                ))
              : Container(
                  height: MediaQuery.of(context).size.height,
                  child: SizedBox(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => productsList.isEmpty
                            ? const Center(child: Text('It is empty'))
                            : ItemMenu(productsList.reversed.toList()[index]),
                        separatorBuilder: (_, index) => const SizedBox(
                              height: 5,
                            ),
                        itemCount: productsList.length),
                  ),
                ),
          // Card(
          //   margin: const EdgeInsets.symmetric(horizontal: 25),
          //   shape:
          //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          //   child: Stack(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(5.0),
          //         child: Row(
          //           children: [
          //             ClipRRect(
          //               borderRadius: BorderRadius.circular(15.0),
          //               child: Image.asset(
          //                 "assets/images/best1.png",
          //                 width: 80.0,
          //               ),
          //             ),
          //             SizedBox(
          //               width: 10,
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 const Text(
          //                   "Product's Name",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, height: 1.5),
          //                 ),
          //                 const Text("Some descriptions",
          //                     style: TextStyle(
          //                         fontWeight: FontWeight.bold, height: 1.5)),
          //                 Text("Rwf 190",
          //                     style: TextStyle(
          //                         color: Theme.of(context).primaryColor,
          //                         fontWeight: FontWeight.bold,
          //                         height: 1.5))
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //       Positioned(
          //         top: 0,
          //         right: 0,
          //         child: Container(
          //           padding: EdgeInsets.all(8.0),
          //           decoration: BoxDecoration(
          //               color: Colors.white.withOpacity(0.9),
          //               shape: BoxShape.circle),
          //           child: Icon(
          //             Icons.favorite,
          //             color: Colors.red,
          //             size: 15,
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
