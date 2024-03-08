import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'presentation/checkout_layout_page/view/checkout_layout_screen.dart';
import 'presentation/checkout_page/view/checkout_screen.dart';
import 'presentation/home_page/view/home_page_screen.dart';
import 'package:open_fashion/presentation/category_screen/bloc/category_bloc.dart';
import 'package:open_fashion/presentation/category_screen/view/category_screen.dart';
import 'presentation/complete_checkout_page/views/complete_checkout.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CategoryScreen(),
    );
  }
}
