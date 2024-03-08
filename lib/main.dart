import 'package:flutter/material.dart';
import 'presentation/checkout_layout_page/view/checkout_layout_screen.dart';
import 'presentation/checkout_page/view/checkout_screen.dart';
import 'presentation/contact_us_page/view/contact_us_screen.dart';
import 'presentation/home_page/view/home_page_screen.dart';
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
      home:const ContactUsScreen(),
    );
  }
}
