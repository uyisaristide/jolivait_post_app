import 'package:flutter/material.dart';
import 'package:shopping/Screens/Cart/ModelCart.dart';
import 'package:shopping/db/DatabaseHelper.dart';

class MyCart extends StatefulWidget {
  final CartModel cartModel;
  final VoidCallback? deleteRefresh;

  const MyCart(this.cartModel, {Key? key, this.deleteRefresh})
      : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {},
        // onTap: () => Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => DetailScreen(cartModel))),
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
                        "assets/images/arrival2.png",
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
                          widget.cartModel.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, height: 1.5),
                        ),
                        const Text("Some description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, height: 1.5)),
                        Text("Rwf 1500",
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
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () async {
                      // print("SOMETHING, PRINTED ${cartModel.id!.toInt()}");
                      final deletes = await DatabaseHelper.instance
                          .deleteCart(widget.cartModel.id!);
                      print(deletes.runtimeType);
                      if (deletes == 1) {
                        // print("This has deleted $deletes");
                        setState(() {
                          widget.deleteRefresh!.call();
                        });
                      }
                    },
                    // onPressed: () async {
                    //   final deletes = await DatabaseHelper.instance.deleteWishList(ca.id);
                    //   print("Deleted successfully $deletes");
                    // },
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
