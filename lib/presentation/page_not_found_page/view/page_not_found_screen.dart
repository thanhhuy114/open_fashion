import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/appbar_custom_widget.dart';
import '../../../widgets/footer.dart';
import '../../home_page/view/home_page_screen.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'PAGE NOT FOUND',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Image.asset('assets/img/page_not_found_icon.png'),
            const Text(
              "We can't find the page you\nlooking for, it will return to the",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final context) => const HomePageScreen(),
                    ));
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                decoration: const BoxDecoration(color: Colors.black),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Home Page',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const FooterWidget()
          ],
        ),
      ),
    );
  }
}
