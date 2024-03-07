// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ItemPolicy extends StatefulWidget {
  ItemPolicy({super.key, required this.checkArrow, required this.name, required this.icon});
  Function checkArrow;
  final String name;
  Icon icon;
  @override
  State<ItemPolicy> createState() => _ItemPolicyState();
}

class _ItemPolicyState extends State<ItemPolicy> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
          widget.icon,
            const SizedBox(width: 10),
            Text(
              widget.name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        IconButton(
          onPressed: () {
            setState(() {
              check = !check;
              widget.checkArrow(check);
            });
          },
          icon: check
              ? const Icon(Icons.keyboard_arrow_up_rounded)
              : const Icon(Icons.keyboard_arrow_down_rounded),
        )
      ],
    );
  }
}
