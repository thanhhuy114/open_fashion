import 'package:flutter/material.dart';
import 'feature/blog_post/pages/blog_post_page/views/blog_post_screen.dart';
import 'locator.dart';
import 'feature/collection/presentation/collection_page/views/collection_screen.dart';
import 'presentation/home_page/view/home_page_screen.dart';
import 'widgets/text_theme_custom.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDefendencies();
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
      home: const BLogPostScreen(),
    );
  }
}
