import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProductDetailPage(),
    );
  }
}
