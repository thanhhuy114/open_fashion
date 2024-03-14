import 'package:flutter/material.dart';

class TagButton extends StatelessWidget {
  const TagButton({
    super.key,
    required this.text,
    required this.isSeleted,
    required this.onTap,
  });

  final String text;
  final bool isSeleted;
  final Function(String text) onTap;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onTap: () => onTap(text),
      child: Container(
        decoration: BoxDecoration(
          color: isSeleted
              ? const Color.fromARGB(255, 199, 197, 197)
              : const Color(0xFFf9f9f9),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(
          left: 14,
          top: 10,
          bottom: 10,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
