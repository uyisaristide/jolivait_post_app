import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/Models/Products.dart';
import 'package:shopping/Screens/WishList/WishListModel.dart';
import 'package:shopping/db/DatabaseHelper.dart';

import '../../Details/Details.dart';

class ItemMenu extends StatelessWidget {
  final Products products;
  ItemMenu(this.products);

  Future authStatus() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? tokens = sharedPreferences.getString("TOKEN");
    return tokens;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailScreen(products))),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        products.thumbnail,
                        width: 80.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products.names,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, height: 1.5),
                        ),
                        Text(products.descriptions,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, height: 1.5)),
                        Text("Rwf ${products.price}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                height: 1.5))
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
                    iconSize: 15,
                    onPressed: () async {
                      final tokeString = await DatabaseHelper.instance.authStatus();
                      if (tokeString != null) {
                        final avStates = await DatabaseHelper.instance
                            .findSingle(products.id);
                        if (avStates == false) {
                          DatabaseHelper.instance.addWishlist(WishListModel(
                              id: null,
                              name: products.names,
                              price: products.price.toInt(),
                              productId: products.id,
                              quantity: products.quantity,
                              userId: 100,
                              description: products.descriptions,
                              details: products.details.toString(),
                              thumbnail: products.thumbnail));
                        } else {
                          print("Can not duplicate data");
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login first'),
                          ),
                        );
                      }

                      // DatabaseHelper.instance.addWishlist(
                      //     WishListModel(
                      //         id: null,
                      //         name: products.names,
                      //         price: products.price.toInt(),
                      //         productId: products.id,
                      //         quantity: products.quantity,
                      //         description: products.descriptions,
                      //         details: products.details.toString(),
                      //         thumbnail: products.thumbnail));
                    },
                    color: Colors.red,
                  ),

                  // DatabaseHelper.instance.wishFound
                  //     ?
                  // IconButton(
                  //         iconSize: 15,
                  //         icon: const Icon(Icons.favorite_border_outlined),
                  //         onPressed: () {
                  //           print("${products.price.runtimeType} is the runtype of price");
                  //           DatabaseHelper.instance.addWishlist(WishListModel(
                  //               id: null,
                  //               name: products.names,
                  //               price: products.price.toInt(),
                  //               quantity: products.quantity,
                  //               description: products.descriptions,
                  //               details: products.details.toString(),
                  //               thumbnail: products.thumbnail));
                  //         },
                  //         color: Colors.red,
                  //       )
                  //     :
                  // IconButton(
                  //         iconSize: 15,
                  //         icon: const Icon(Icons.favorite),
                  //         onPressed: () {
                  //           DatabaseHelper.instance.addWishlist(WishListModel(
                  //               id: products.id,
                  //               name: products.names,
                  //               price: products.price,
                  //               quantity: products.quantity,
                  //               description: products.descriptions,
                  //               details: "Some few details",
                  //               thumbnail: products.thumbnail));
                  //         },
                  //         color: Colors.red,
                  //       ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// _findProduct(int id) async {
//   if (await DatabaseHelper.instance.findSingle(id) == false) {
//     var status = await DatabaseHelper.instance.findSingle(id);
//     print("This is wishList status $status");
//     return
//
//     return IconButton(
//       iconSize: 15,
//       icon: const Icon(Icons.favorite_border_outlined),
//       onPressed: () {
//         print("${products.price.runtimeType} is the runtype of price");
//         DatabaseHelper.instance.addWishlist(WishListModel(
//             id: null,
//             name: products.names,
//             price: products.price.toInt(),
//             quantity: products.quantity,
//             description: products.descriptions,
//             details: products.details.toString(),
//             thumbnail: products.thumbnail));
//       },
//       color: Colors.red,
//     );
//   }else{
//
//     return IconButton(
//       iconSize: 15,
//       icon: const Icon(Icons.favorite),
//       onPressed: () =>const SnackBar(content: Text("Already saved to wishlist"),),
//       color: Colors.red,
//     );
//
//   }
// }
}
