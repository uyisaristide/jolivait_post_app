import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/db/DatabaseHelper.dart';
import '../../Models/Products.dart';
import 'ModelCart.dart';
import 'MyCart.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var productsList = Products.generateItems();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 15),
              child: Center(
                child: Text(
                  "Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 430,
              child: SizedBox(
                  child: FutureBuilder<List<CartModel>>(
                      future: DatabaseHelper.instance.cartList(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<CartModel>> snapshot) {
                        if (snapshot.hasData) {
                          try {
                            final wishObj = snapshot.data as List<CartModel>;
                            // print("This is the data ${snapshot.data}");
                            // print("This is number of something in cart ${wishObj.length}");
                            return snapshot.data!.isNotEmpty
                                ? StatefulBuilder(
                                  builder: (context, setState) {
                                    return
                                      ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) =>
                                            MyCart(wishObj[index],deleteRefresh:(){
                                              setState((){
                                                wishObj.removeWhere((e) => e.id == wishObj[index].id);
                                              });
                                            }),
                                        separatorBuilder: (_, index) =>
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        itemCount: wishObj.length);
                                  }
                                  )
                                : const Center(child: Text("Data is null"));
                          } catch (e) {
                            print("This error occurred $e");
                            throw e;
                          }
                        } else if (snapshot.hasError) {
                          return const Icon(Icons.error_outline);
                        } else {
                          return const CircularProgressIndicator();
                        }
                      })
                  // ListView.separated(
                  //     scrollDirection: Axis.vertical,
                  //     itemBuilder: (context, index) =>
                  //         MyCart(productsList[index]),
                  //     separatorBuilder: (_, index) => const SizedBox(
                  //       height: 5,
                  //     ),
                  //     itemCount: productsList.length),
                  ),
            ),
            Center(
              child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.payment),
                  label: const Text('Proceed to pay')),
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
      ),
    );
  }
}
