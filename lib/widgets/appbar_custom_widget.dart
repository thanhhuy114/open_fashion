// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../presentation/cart_page/views/cart.dart';
import '../presentation/srearch_page/bloc/search_page_provider.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  AppBarCustom({super.key, this.color});
  Color? color;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(final BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: widget.color ?? Colors.white,
      centerTitle: true,
      title: SizedBox(
        height: 32,
        width: 78,
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          color: widget.color != null ? Colors.white : null,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Image.asset(
          'assets/images/menu.png',
          height: 25,
          width: 24,
          fit: BoxFit.cover,
          color: widget.color != null ? Colors.white : null,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () async => Navigator.push(
            context,
            MaterialPageRoute(builder: (final _) => const SearchPageProvider()),
          ),
          child: Image.asset(
            'assets/images/search.png',
            fit: BoxFit.cover,
            height: 24,
            width: 24,
            color: widget.color != null ? Colors.white : null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: GestureDetector(
            onTap: () async => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (final context) => const CartPage(products: []),
              ),
            ),
            child: Image.asset(
              'assets/images/shopping bag.png',
              fit: BoxFit.cover,
              height: 24,
              width: 24,
              color: widget.color != null ? Colors.white : null,
            ),
          ),
        ),
      ],
    );
  }
}
