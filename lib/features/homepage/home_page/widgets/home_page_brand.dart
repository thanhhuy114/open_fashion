import 'package:flutter/material.dart';

class HomePageBrand extends StatelessWidget {
  const HomePageBrand({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset('assets/img/3.png'),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset('assets/img/Prada.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/img/Catier.png'),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/img/Burberry.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/img/Gucci.png'),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/img/Boss.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/img/Tiffany & Co.png'),
                ],
              ),
            ],
          ),
        ),
        Image.asset('assets/img/3.png'),
      ],
    );
  }
}
