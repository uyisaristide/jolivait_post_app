import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shopping/Models/Products.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/Screens/Menu/Widgets/MenuItems.dart';
import '../Home/Widgets/Search.dart';
import 'Widgets/ItemCard.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var productsList = <Products>[];
  var results = <Products>[];
  late String fromForm;
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
    // TODO: implement initState
    super.initState();
    fetchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(
            callback: ((value) {
              final found = productsList
                  .where(
                      (element) => element.names.toLowerCase().contains(value))
                  .toList();
              setState(() {
                if (found.isNotEmpty) {
                  results = found;
                }else{
                  MenuScreen();
                }
                print("${results.first.names} Results found successfully");
              });
            }),
          ),
          results.isEmpty
              ? MenuItems()
              : SizedBox(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => results.isEmpty
                          ? const Center(child: Text('It is empty'))
                          : ItemMenu(results.reversed.toList()[index]),
                      separatorBuilder: (_, index) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: results.length),
                )

          // StatefulBuilder(
          //     builder: (BuildContext context, StateSetter setState) {
          //       return
          //       SizedBox(
          //         child: ListView.separated(
          //             scrollDirection: Axis.vertical,
          //             shrinkWrap: true,
          //             itemBuilder: (context, index) =>
          //             productsList.isEmpty
          //                 ? const Center(child: Text('It is empty'))
          //                 : ItemMenu(productsList.reversed.toList()[index]),
          //             separatorBuilder: (_, index) =>
          //             const SizedBox(
          //               height: 5,
          //             ),
          //             itemCount: productsList.length),
          //       );
          //     }
          // ),
        ],
      ),
    );
  }
}
