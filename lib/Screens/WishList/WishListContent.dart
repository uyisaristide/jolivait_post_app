import 'package:flutter/material.dart';
import 'package:shopping/db/DatabaseHelper.dart';
import '../../Models/Products.dart';
import '../Details/Details.dart';

class WishContent extends StatefulWidget {
  final Products products;
  final VoidCallback? deleteCallback;
  const WishContent(this.products,{Key? key, this.deleteCallback}):super(key: key);

  @override
  State<WishContent> createState() => _WishContentState();
}

class _WishContentState extends State<WishContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailScreen(widget.products))),
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
                        widget.products.thumbnail,
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
                          widget.products.names,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, height: 1.5),
                        ),
                        Text(widget.products.descriptions,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, height: 1.5)),
                        Text("Rwf ${widget.products.price}",
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
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () async{
                      setState(() {});
                      final deletes = await DatabaseHelper.instance.deleteWishList(widget.products.id);
                      if(deletes == 1){
                        setState(() {
                          widget.deleteCallback?.call();
                        });
                      }
                    },
                    iconSize: 20,
                    icon: const Icon(Icons.favorite),
                    color: Colors.red,
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
