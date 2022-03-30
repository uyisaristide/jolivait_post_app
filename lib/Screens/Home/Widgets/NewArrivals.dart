import 'package:flutter/material.dart';
import 'package:shopping/Screens/Home/Widgets/ItemsWidget.dart';

import '../../../Models/Products.dart';
import 'CategoryList.dart';

class NewArrivals extends StatelessWidget {
  final productsList = Products.generateItems();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CategoryList(
          title: 'New items',
        ),
        Container(
            child: SizedBox(
          height: 250,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Items(productsList[index]),
              separatorBuilder: (_, index) => const SizedBox(
                    width: 5.0,
                  ),
              itemCount: productsList.length),
        )),
      ],
    ));
  }
}
