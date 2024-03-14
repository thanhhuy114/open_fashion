import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/img/Twitter.png'),
              Image.asset('assets/img/Instagram.png'),
              Image.asset('assets/img/YouTube.png'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Image.asset('assets/img/div.png'),
        ),
        const Text(
          'support@openui.design',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          '+60 825 876',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          '08:00 - 22:00 - Everyday',
          style: TextStyle(fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Image.asset('assets/img/div.png'),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Contact',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Blog',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Copyright© OpenUI All Rights Reserved.',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
