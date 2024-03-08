// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/pick_favorie/favorite_cubit.dart';

class ButtonBasket extends StatefulWidget {
  const ButtonBasket({super.key});

  @override
  State<ButtonBasket> createState() => _ButtonBasketState();
}

class _ButtonBasketState extends State<ButtonBasket> {
  bool checkFavorite = false;

  @override
  void initState() {
    super.initState();
  }

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
            const Row(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 28,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
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
                      ? const Icon(Icons.favorite_sharp, color: Colors.red)
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
