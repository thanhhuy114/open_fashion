import 'package:flutter/material.dart';

import 'footer.dart';

class TittleWidget extends StatelessWidget {
  const TittleWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(final BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      height: 75.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(height: 15),
          //Thach 14:00 7/3 Add letterSpasing for Text
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(letterSpacing: 4),
          ),
          // Image.asset(
          //   'assets/images/3.png',
          //   fit: BoxFit.cover,
          //   width: 125,
          //   height: 10,
          // ),
          //Thach 14:00 7/3 Change img become Dividercustom
          const DividerCustom(),
        ],
      ),
    );
  }
}
