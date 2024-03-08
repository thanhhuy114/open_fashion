import 'package:flutter/material.dart';
import 'presentation/blog_grid_page/bloc/bloc_grid_page_provider.dart';
import 'presentation/blog_post_page/views/blog_post_screen.dart';
import 'presentation/complete_checkout_page/views/complete_checkout.dart';
import 'presentation/home_page/view/home_page_screen.dart';
import 'presentation/our_story_page/views/our_story.dart';
import 'presentation/product_detail_layout_page/views/product_detail_layout.dart';
import 'presentation/product_detail_page/views/product_detail.dart';
import 'widgets/text_theme_custom.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextThemeCustom(),
      ),
      home: const ProductDetailLayoutPage(),
    );
  }
}
