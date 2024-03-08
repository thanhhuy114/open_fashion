import 'package:flutter/material.dart';
import 'presentation/blog_grid_page/bloc/bloc_grid_page_provider.dart';
import 'presentation/category_screen/view/category_screen.dart';
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
        useMaterial3: true,
        textTheme: TextThemeCustom(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: Colors.white),
      ),
      home: const BlocGridPageProvider(),
    );
  }
}
