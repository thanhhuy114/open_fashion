import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return AppBar(
      title: Image.asset('assets/img/Logo.png'),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(231, 234, 239, 1),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
      ],
    );
  }
}
