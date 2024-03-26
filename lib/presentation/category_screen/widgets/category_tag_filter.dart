import 'package:flutter/material.dart';

class TagFilter extends StatelessWidget {
  const TagFilter({required this.tagName, super.key});
  final String tagName;
  @override
  Widget build(final BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            tagName,
            style: const TextStyle(fontSize: 16),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
