import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    required this.message,
    required this.onTap,
    required this.icon,
  });
  final String message;
  final Function()? onTap;
  final Icon? icon;
  @override
  Widget build(final BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(),
        minimumSize: const Size(double.infinity, 56),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          const SizedBox(width: 14),
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
