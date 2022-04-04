import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CategoryList.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/Models/Products.dart';

import 'ItemsWidget.dart';

// const getUrl = 'https://product-mgt-api.herokuapp.com/api/product';

// Future<List<Products>> fetchProduct() async {
//   try {
//     final response = await http.get(Uri.parse(getUrl));
//     if (response.statusCode == 200) {
//       List data = jsonDecode(response.body);
//       List<Products> productList = data.isNotEmpty ? data.map((e) => Products.fromJson(e)).toList() : [];
//       print("This is the length ${productList.length}");
//       return productList;
//
//     } else if (response.statusCode == 401) {
//       print("This is contains the error ${response.body}");
//       print("Unauthenticated");
//       return jsonDecode(response.body);
//     } else {
//       throw Exception("Data not found");
//     }
//   } catch (error) {
//     throw Exception(error);
//   }
// }

class NewArrivals extends StatefulWidget {
  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  var productsList = <Products>[];
  dynamic errors = const CircularProgressIndicator(color: Colors.teal,);
  @override
  void initState() {
    super.initState();
    readProducts();
  }

  void readProducts() async {
    try{
      final response = await http
          .get(Uri.parse('https://product-mgt-api.herokuapp.com/api/product')).timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        // print(response.body);
        // print("${jsonDecode(response.body)} some data.names");
        final responseProducts = (jsonDecode(response.body) as Iterable)
            .map((e) => Products.fromJson(e))
            .toList();
        // print("There is no error with data ${response.body.toString()}");
        setState(() {
          productsList = responseProducts;
          // final dataMapping = Products.fromJson(jsonDecode(response.body));
        });
      } else if (response.statusCode == 401) {
        print("This is contains the error ${response.body}");
        print("Unauthenticated");
        //return jsonDecode(response.body);
      } else {
        throw Exception("Data not found");
      }
    }on TimeoutException catch(_){
      setState(() {
        errors = const Text("Time out error, tap to retry!");
      });
      throw TimeoutException("Timeout");
    }on SocketException catch(error){
      setState(() {
        errors = const Text("Turn on Wifi, tap to retry!");
      });
      throw "Message for error: $error Network exception";
    }
    catch(e){
      const Text("Network error found");
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // readProducts();
    return Container(
        child: Column(
      children: [
        CategoryList(
          title: 'New items',
        ),
        productsList.isEmpty
            ?Center(
                child:InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: errors,
                  ),
                  onTap: (){
                    // print("Printed successfully");
                    setState((){
                      Navigator.pushNamed(context, '/');
                    });
                  },
                )
              )
            : Container(
                child: SizedBox(
                height: 250,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    itemBuilder: (context, index)=> Items(productsList[index]),
                    separatorBuilder: (_, index) => const SizedBox(
                          width: 5,
                        ),
                    itemCount: ((productsList.length) ~/ 5) > 0
                        ? (productsList.length) ~/ 5
                        : productsList.length),
              )),
      ],
    ));
  }

// _sendingDataFunction() {
//   FutureBuilder<List<Products>>(
//     future: productsLists,
//     builder: (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
//       print("Some error detected successfully ${snapshot.error}");
//       if (!snapshot.hasData) {
//         print(snapshot.data);
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       } else if (snapshot.hasError) {
//         print(snapshot.error);
//         return const Center(
//           child: Text(
//             "Loading with error",
//             style: TextStyle(
//                 color: Colors.red,
//                 fontSize: 20.0,
//                 fontStyle: FontStyle.italic),
//           ),
//         );
//       }
//         final allData = snapshot.data as List<Products>;
//       print("Some data found here in List separator ! ${allData.runtimeType}");
//         return snapshot.data!.isEmpty ? const Center(
//           child: Text("The object might be empty! "),
//         ):ListView.separated(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             itemBuilder: (context, index) {
//
//               return Items(allData[index]);
//             },
//             separatorBuilder: (_, index) => const SizedBox(
//                   width: 5,
//                 ),
//             itemCount: allData.length
//         );
//     },
//   );
// }
}

// ListView.separated(
// scrollDirection: Axis.horizontal,
// padding: const EdgeInsets.symmetric(horizontal: 25.0),
// itemBuilder: (context, index){
// final productObj = productsLists;
// print(productObj.runtimeType);
// return Items(productObj);
// },
// // itemBuilder: (context, index)=> Items(productsList[index]),
// separatorBuilder: (_, index) => const SizedBox(
// width: 5,
// ),
// itemCount: productsList.length
// );

// ListView.separated(
// scrollDirection:Axis.horizontal,
// padding: const EdgeInsets.symmetric(horizontal: 25.0),
// itemBuilder: (context, index) =>Items(productsList[index]),
// separatorBuilder: (_, index)=>const SizedBox(width: 5,),
// itemCount: productsList.length
// ),
