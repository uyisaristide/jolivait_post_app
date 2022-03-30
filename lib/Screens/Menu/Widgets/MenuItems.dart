import 'package:flutter/material.dart';
import 'package:shopping/Screens/Menu/Widgets/ItemCard.dart';

import '../../../Models/Products.dart';
class MenuItems extends StatefulWidget {
  @override
  State<MenuItems> createState() => _MenuItemsState();
}
class _MenuItemsState extends State<MenuItems> {
  final productsList = Products.generateItems();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15),
            child: Center(child: Text("All products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
          ),
          ListView.separated(
              itemBuilder: (context, index)=>ItemMenu(productsList[index]),
              shrinkWrap: true,
              separatorBuilder: (_, index)=>const SizedBox(height: 4,),
              itemCount: productsList.length
          )
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
