import 'package:flutter/material.dart';

/*
  Create by: Thach
  Date: 7/3 15:00
  Content: Show invalid of TextField

 */
class ShowValidator extends StatelessWidget {
  const ShowValidator({super.key, this.validate = '', required this.isValid});
  final validate;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return isValid
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: 20,
            child: Text(
              validate,
              style: const TextStyle(color: Colors.red),
            ),
          )
        : const SizedBox();
  }
}
