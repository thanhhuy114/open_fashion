import 'dart:math';

import 'package:flutter/material.dart';

class Indicatior extends StatelessWidget {
  const Indicatior({
    super.key,
    required this.total,
    required this.active,
  });
  final int total;
  final int active;
  @override
  Widget build(final BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(total, (final index) {
          return dot(
            color: index == active
                ? const Color.fromRGBO(221, 133, 96, 1)
                : Colors.white,
            colorBorder: index == active
                ? const Color.fromRGBO(221, 133, 96, 1)
                : const Color.fromRGBO(136, 136, 136, 1),
          );
        }),
      ),
    );
  }
}

Widget dot({
  final Color color = Colors.white,
  final Color colorBorder = Colors.black,
}) {
  return Transform.rotate(
    angle: pi / 4,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        border: Border.all(color: colorBorder),
        color: color,
      ),
    ),
  );
}
