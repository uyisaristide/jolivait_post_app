import 'package:flutter/material.dart';
import 'package:shopping/Models/Products.dart';
import 'package:shopping/Screens/Cart/ModelCart.dart';
import 'package:shopping/db/DatabaseHelper.dart';

class AddToCart extends StatelessWidget {
  final Products products;

  const AddToCart(this.products);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "Rwf ${products.price.toString()}",
                style: const TextStyle(
                    height: 1.5, fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            width: 18.0,
          ),
          Expanded(
            child: Container(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0.0,
                      primary: Theme.of(context).primaryColor),
                  onPressed: () async {
                    final tokenStrings = await DatabaseHelper.instance.authStatus();
                    if (tokenStrings != null) {
                      final findInCarts =
                          await DatabaseHelper.instance.findInCart(products.id);
                      if (findInCarts == false) {
                        // print("Going to save");
                        // print("$tokenStrings Found in cart");
                        DatabaseHelper.instance.addToCart(
                          CartModel(
                              id: null,
                              name: products.names,
                              quantity: 1,
                              productId: products.id,
                              userId: 100),
                        );
                      } else {
                        print("Already in cart please!");
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login first'),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_cart_outlined)
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
