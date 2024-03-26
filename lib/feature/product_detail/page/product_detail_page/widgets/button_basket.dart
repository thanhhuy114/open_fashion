// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../models/checkout_response_model.dart';
import '../cubit/pick_favorie/favorite_cubit.dart';

class ButtonBasket extends StatefulWidget {
  const ButtonBasket({super.key, required this.productItem});
  final ProductItem productItem;
  @override
  State<ButtonBasket> createState() => _ButtonBasketState();
}

class _ButtonBasketState extends State<ButtonBasket> {
  bool checkFavorite = false;
  @override
  Widget build(final BuildContext context) {
    return Container(
      color: Colors.black,
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // final List<ProductItem> products = [];
                    // setState(() {
                    //   products.add(widget.productItem);
                    //   products.add(widget.productItem);
                    // });
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (final context) =>
                    //         CartPage(products: products),
                    //   ),
                    // );
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'ADD TO BASKET',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            BlocBuilder<FavoriteCubit, bool>(
              builder: (final context, final state) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      checkFavorite = !checkFavorite;
                    });
                  },
                  icon: checkFavorite
                      ? const Icon(
                          Icons.favorite_sharp,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_sharp,
                          color: Colors.white,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
