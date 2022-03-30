import 'package:flutter/material.dart';
import 'package:shopping/Screens/Details/Widget/AddCart.dart';
import 'package:shopping/Screens/Details/Widget/DetailAppBar.dart';
import 'package:shopping/Screens/Details/Widget/ProductInfo.dart';
import 'package:shopping/Screens/Details/Widget/SizeList.dart';
import '../../Models/Products.dart';

class DetailScreen extends StatelessWidget {
  final Products products;

  DetailScreen(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailAppBar(products),
            ProductInfo(products),
            SizedList(),
            AddToCart(products)
          ],
        ),
      ),
    );
  }
}
