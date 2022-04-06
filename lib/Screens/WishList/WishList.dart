import 'package:flutter/material.dart';
import 'package:shopping/Screens/WishList/WishListContent.dart';
import 'package:shopping/db/DatabaseHelper.dart';
import '../../Models/Products.dart';

class WishList extends StatefulWidget {
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
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
                  "Wish list",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 430,
              child: SizedBox(
                  child: FutureBuilder<List<Products>>(
                      future: DatabaseHelper.instance.getWishList(),
                      builder: (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {

                        if(!snapshot.hasData){
                          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),);
                        }
                        final allData = snapshot.data as List<Products>;
                        print("Saved products are: ${allData.length}");

                        if (snapshot.hasData) {
                          return snapshot.data!.isEmpty
                              ? const Center(child: Text("Wish list Empty"),)
                              :ListView.separated(
                              itemBuilder: (context, index) =>
                                  WishContent(allData[index]),
                              separatorBuilder: (_, index) =>
                              const SizedBox(
                                height: 5,
                              ),
                              itemCount: allData.length);
                        } else if (snapshot.hasError) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Icon(Icons.error_outline);
                        } else {
                          return CircularProgressIndicator();
                        }
                      })
                  // ListView.separated(
                  //     scrollDirection: Axis.vertical,
                  //     itemBuilder: (context, index) =>
                  //         WishContent(productsList.reversed.toList()[index]),
                  //     separatorBuilder: (_, index) => const SizedBox(
                  //           height: 5,
                  //         ),
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
