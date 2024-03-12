import 'package:flutter/material.dart';
import 'presentation/add_address_page/view/add_address_screen.dart';
import 'presentation/add_cart_page/view/add_card_screen.dart';
import 'presentation/checkout_page/view/checkout_screen.dart';
import 'presentation/home_page/view/home_page_screen.dart';
import 'presentation/payment_page/views/payment.dart';
import 'presentation/product_detail_layout_page/views/product_detail_layout.dart';
import 'presentation/blog_grid_page/bloc/bloc_grid_page_provider.dart';
import 'presentation/category_screen/view/category_screen.dart';
import 'widgets/text_theme_custom.dart';

import 'presentation/blog_grid_page/view/blog_grid_page.dart';
import 'presentation/home_page/view/home_page_screen.dart';
import 'presentation/our_story_page/views/our_story.dart';
import 'presentation/product_detail_layout_page/views/product_detail_layout.dart';
import 'presentation/product_detail_page/views/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Open Fashion',
      theme: ThemeData(
        fontFamily: 'TenorSans',
        useMaterial3: true,
        textTheme: TextThemeCustom(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: Colors.white),
      ),
      home: const HomePageScreen(),

    );
  }
}
