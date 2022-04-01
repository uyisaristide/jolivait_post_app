import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../Models/Products.dart';
import 'ColorPicker.dart';

class DetailAppBar extends StatefulWidget {
  final Products products;

  DetailAppBar(this.products);

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  final List<Color> colors = [
    const Color(0xFFE6CFC6),
    const Color(0xFFEEDFB5),
    const Color(0xFFCAE2C5),
    const Color(0xFFBAE6EE),
  ];

  final CarouselController _controller = CarouselController();
  int _currentPage = 0;
  int _currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                height: 400,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              items: widget.products.details
                  .map((e) => Builder(
                        builder: (context) => Container(
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('$e'),
                                fit: BoxFit.fitHeight,
                              ),
                              borderRadius: BorderRadius.circular(25.0)),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Positioned(
              bottom: 30,
              left: 150,
              child: Row(
                children: widget.products.details
                    .asMap()
                    .entries
                    .map((entry) => GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: 12,
                            height: 23,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(
                                    _currentPage == entry ? 0.9 : 0.4)),
                          ),
                        ))
                    .toList(),
              )),
          Positioned(
              bottom: 30,
              right: 30,
              child: Container(
                height: 160,
                width: 45,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30.0)),
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () => setState(() {
                              _currentColor = index;
                            }),
                        child:
                            ColorPicker(_currentColor == index, colors[index])),
                    separatorBuilder: (_, index) => const SizedBox(),
                    itemCount: colors.length),
              )),
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle),
                    child: const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(Icons.arrow_back_ios,
                            color: Colors.grey, size: 15)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle),
                  child: const Icon(Icons.more_horiz,
                      color: Colors.grey, size: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
