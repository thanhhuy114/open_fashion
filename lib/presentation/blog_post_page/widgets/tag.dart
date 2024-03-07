import 'package:flutter/material.dart';

class ListTag extends StatefulWidget {
  const ListTag({super.key, required this.tags, required this.clickTag});
  final List tags;
  final Function(String) clickTag;

  @override
  State<ListTag> createState() => _ListTagState();
}

class _ListTagState extends State<ListTag> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: widget.tags.map((tag) {
          return GestureDetector(
            onTap: () {
              widget.clickTag(tag);
              setState(() {
                isClicked = !isClicked;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(245, 245, 245, 1),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '#$tag',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(136, 136, 136, 1)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
