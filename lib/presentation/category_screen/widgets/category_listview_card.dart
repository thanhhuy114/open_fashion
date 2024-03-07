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
            mycat.image!,
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
                    Text(mycat.name!.toUpperCase()),
                    Text(mycat.description!),
                    Text('\$ ${mycat.price}'),
                  ],
                ),
                Row(
                  children: [Icon(Icons.star), Text('4.8 Ratings')],
                ),
                Row(
                  children: [
                    const Text('Size'),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: const Text('S'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: const Text('M'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: const Text('L'),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 25,
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
