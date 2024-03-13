import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    required this.message,
    required this.onTap,
    required this.icon,
    required this.checkLR,
  });
  final String message;
  final Function()? onTap;
  final Icon? icon;
  final bool checkLR;
  @override
  Widget build(final BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(),
        minimumSize: const Size(double.infinity, 60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(visible: checkLR, child: icon!),
          const SizedBox(width: 14),
          Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
          const SizedBox(width: 14),
          Visibility(visible: !checkLR, child: icon!),
        ],
      ),
    );
  }
}
