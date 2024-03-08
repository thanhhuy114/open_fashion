import 'package:flutter/material.dart';
import 'presentation/blog_grid_page/bloc/bloc_grid_page_provider.dart';
import 'widgets/text_theme_custom.dart';
import 'presentation/home_page/view/home_page_screen.dart';

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
      home:const BlocGridPageProvider(),
    );
  }
}
