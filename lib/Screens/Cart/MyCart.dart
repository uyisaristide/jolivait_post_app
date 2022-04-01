import 'package:flutter/material.dart';
import '../../Models/Products.dart';
import '../Details/Details.dart';

class MyCart extends StatelessWidget {
  final Products products;
  MyCart(this.products);
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
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 15,
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
