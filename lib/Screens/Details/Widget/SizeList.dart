import 'package:flutter/material.dart';

class SizedList extends StatefulWidget {
  @override
  State<SizedList> createState() => _SizedListState();
}

class _SizedListState extends State<SizedList> {
  final List<String> sizedList = ['S', 'M', 'L', 'XL', 'XXL'];
  final int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() {
                  currentSelected == index;
                }),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: currentSelected == index
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.1), width: 2)),
                  child: Text(
                    sizedList[index],
                    style: TextStyle(
                        color: currentSelected == index
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),


              ),
          separatorBuilder: (_, index) => const SizedBox(
                width: 10,
              ),
          itemCount: sizedList.length),
    );
  }
}
