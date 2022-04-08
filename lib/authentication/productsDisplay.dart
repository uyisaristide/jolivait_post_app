import 'package:flutter/material.dart';

import 'package:shopping/authentication/widgets/productsList.dart';

class productsDisplay extends StatefulWidget {
  const productsDisplay({Key? key}) : super(key: key);

  @override
  State<productsDisplay> createState() => _productsDisplayState();
}

class _productsDisplayState extends State<productsDisplay> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [productsList()],
      ),
    );
  }
}
