import 'package:flutter/material.dart';

class ItemReminder extends StatelessWidget {
  const ItemReminder({
    super.key,
    required this.image,
    required this.txtReminder,
  });
  final String image;
  final String txtReminder;
  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Image.network(
            image,
          ),
          const SizedBox(width: 10),
          Text(txtReminder),
        ],
      ),
    );
  }
}
