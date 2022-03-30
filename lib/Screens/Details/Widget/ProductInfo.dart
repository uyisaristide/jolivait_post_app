import 'package:flutter/material.dart';
import '../../../Models/Products.dart';

class ProductInfo extends StatelessWidget {
  final Products product;

  ProductInfo(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${product.names}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 15,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              children: [
                Icon(
                  Icons.star_border,
                  color: Theme.of(context).primaryColor,
                ),
                const Text(
                  "3.4 (2.5k)",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Much more descriptions",
                  style: TextStyle(color: Colors.grey.withOpacity(0.7), height: 1.5)
                ),
                TextSpan(
                  text: " Read More", style: TextStyle(color: Theme.of(context).primaryColor, fontStyle: FontStyle.italic)
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}
