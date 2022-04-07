import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? callback;

  const CustomAppBar({Key? key, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25.0, right: 25.0),
      // padding: const EdgeInsets.only(top: 30.0, left:25.0, right:25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                  text: 'Howdy, What are you\nlooking for?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " 👀",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
            ),
          ]),
          Stack(children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0.1,
                        blurRadius: 0.1,
                        offset: const Offset(0, 1))
                  ]),
              child: IconButton(
                color: Colors.grey,
                onPressed: callback,
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 20,
                ),
              ),
            ),
            Positioned(
                right: 0.0,
                bottom: 40,
                left: 20,
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle),
                ))
          ]),
        ],
      ),
    );
  }
}
