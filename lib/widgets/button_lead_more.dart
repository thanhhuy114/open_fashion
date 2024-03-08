
import 'package:flutter/material.dart';

class ButtonLeadMore extends StatelessWidget {
  const ButtonLeadMore({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: const Color(0xFFDEDEDE),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LEAD MORE',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(width: 15),
            Image.asset(
              'assets/images/plus.png',
              height: 25,
              width: 24,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
