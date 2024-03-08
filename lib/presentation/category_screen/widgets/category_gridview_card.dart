import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../models/category.dart';

class CategoryGridviewCard extends StatelessWidget {
  const CategoryGridviewCard(
      {required this.myCat, super.key, required this.status});
  final Cat myCat;
  final bool status;
  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (status == false) {
                    showDialog(
                      context: context,
                      builder: (context) => ImageDialog(src: myCat.image),
                    );
                  }
                },
                child: Image.network(myCat.image[0]!),
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  Icons.favorite_border_sharp,
                  color: Colors.orange,
                ),
              )
            ],
          ),
          Text(
            myCat.name!,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          Text(
            myCat.description!,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1), fontSize: 12),
          ),
          Text(
            '\$${myCat.price}',
            style: const TextStyle(color: Colors.orange, fontSize: 15),
          )
        ],
      ),
    );
  }
}

class ImageDialog extends StatefulWidget {
  const ImageDialog({required this.src, Key? key}) : super(key: key);

  final List<String?> src;

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  int _currentIndex = 0;
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                viewportFraction: 0.7,
                enableInfiniteScroll: false,
                initialPage: 0,
                height: MediaQuery.of(context).size.height,
                scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: widget.src.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      margin: const EdgeInsets.all(8.0),
                      child: Image.network(
                        i!,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.9,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: 30,
              child: ListView.builder(
                itemCount: widget.src.length,
                itemBuilder: (context, index) {
                  return Transform.rotate(
                    angle: pi / 4,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 10,
                      decoration: BoxDecoration(
                        color: index == _currentIndex
                            ? Colors.brown
                            : Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
