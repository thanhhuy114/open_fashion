import 'package:flutter/material.dart';
import 'package:open_fashion/presentation/category_screen/model/category.dart';

class CategoryListViewCard extends StatelessWidget {
  const CategoryListViewCard({required this.mycat, super.key});
  final Cat mycat;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            mycat.image[0]!,
            width: 100,
            height: 500,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mycat.name!.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      mycat.description!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '\$ ${mycat.price}',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text(
                      '4.8 Ratings',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text('Size'),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            padding: const EdgeInsets.fromLTRB(7, 2, 7, 2),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: const Text(
                              'S',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            padding: const EdgeInsets.fromLTRB(7, 2, 7, 2),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: const Text(
                              'M',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            padding: const EdgeInsets.fromLTRB(7, 2, 7, 2),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: const Text(
                              'L',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.orange,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
