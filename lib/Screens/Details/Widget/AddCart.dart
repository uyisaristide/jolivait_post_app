import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Models/Products.dart';

class AddToCart extends StatelessWidget {
  final Products products;

  AddToCart(this.products);

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
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0.0,
                      primary: Theme.of(context).primaryColor),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(width: 10.0,),
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
