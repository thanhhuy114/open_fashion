import 'package:flutter/material.dart';
import 'feature/blog_post/pages/blog_post_page/views/blog_post_screen.dart';
import 'injection_container.dart';
import 'features/homepage/home_page/view/home_page_screen.dart';
import 'widgets/text_theme_custom.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
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
