import 'package:flutter/material.dart';

class ItemContentShow extends StatelessWidget {
  const ItemContentShow({
    super.key,
    required this.checked,
    required this.name,
    required this.content,
  });
  final bool checked;
  final String name;
  final String content;
  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34, right: 34),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: checked ? null : 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              content,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
