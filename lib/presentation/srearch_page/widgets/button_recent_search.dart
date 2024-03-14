import 'package:flutter/material.dart';

class ButtonRecentSearch extends StatelessWidget {
  const ButtonRecentSearch({
    super.key,
    required this.text,
    required this.onTap,
    required this.onRemove,
  });

  final String text;
  final Function() onTap;
  final Function() onRemove;

  @override
  Widget build(final BuildContext context) {
    final inkWell = InkWell(
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFf9f9f9),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF555555),
              ),
            ),
            const SizedBox(width: 6),
            InkWell(
              onTap: onRemove,
              child: const Icon(
                Icons.close,
                size: 14,
                color: Color(0xFF878792),
              ),
            ),
          ],
        ),
      ),
    );
    return inkWell;
  }
}
