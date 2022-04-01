import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Screens/Menu/Widgets/MenuItems.dart';

class CategoryList extends StatelessWidget {
  final String title;

  CategoryList({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          // Row(
          //   children: [
          //     Text(
          //       'View all',
          //       style: TextStyle(
          //           color: Theme.of(context).primaryColor,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 15.0),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     Container(
          //       height: 30,
          //       width: 30,
          //       padding: const EdgeInsets.all(0.0),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10.0),
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       child: IconButton(
          //         color: Colors.white,
          //         onPressed: () => Navigator.push(context,
          //             CupertinoPageRoute(builder: (context) => MenuItems())),
          //         iconSize: 15,
          //         icon: const Icon(Icons.arrow_forward_ios),
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
