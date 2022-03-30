import 'package:flutter/material.dart';
import 'package:shopping/Models/Products.dart';

import '../../Details/Details.dart';

class Items extends StatelessWidget {
  final Products products;

  Items(this.products);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailScreen(products))),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    height: 170,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: AssetImage(products.thumbnail),
                            fit: BoxFit.fitHeight)),
                  ),
                  Positioned(
                      right: 20,
                      top: 15,
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
                      )
                  ),
                ],
              ),
              Text(
                products.names,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, height: 1.5),
              ),
              Text(
                products.price.toString(),
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
