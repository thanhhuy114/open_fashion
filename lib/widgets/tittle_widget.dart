import 'package:flutter/material.dart';

class TittleWidget extends StatelessWidget {
  const TittleWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(final BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      height: 70.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(height: 15),
          Text(text, style: Theme.of(context).textTheme.titleLarge),
          Image.asset(
            'assets/images/3.png',
            fit: BoxFit.cover,
            width: 125,
            height: 15,
          ),
        ],
      ),
    );
  }
}
