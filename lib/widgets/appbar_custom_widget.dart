import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../presentation/srearch_page/bloc/search_page_provider.dart';
import '../presentation/srearch_page/view/screach_page.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

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
      backgroundColor: Colors.white,
      centerTitle: true,
      title: SizedBox(
        height: 32,
        width: 78,
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Image.asset(
            'assets/images/shopping bag.png',
            fit: BoxFit.cover,
            height: 24,
            width: 24,
          ),
        ),
      ],
    );
  }
}
