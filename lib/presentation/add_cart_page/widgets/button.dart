import 'package:flutter/material.dart';

/*
  Create by: Thach
  Date: 7/3 15:22,
  Content: Botton for Add Address, Add Cart, Place Order, Check Out
 */
// ignore: must_be_immutable
class BottomButtonCustom extends StatefulWidget {
  BottomButtonCustom({
    super.key,
    required this.content,
    required this.height,
    required this.width,
    required this.onTap,
    this.leading,
    this.trainling,
    this.color = Colors.black,
    this.colorContent = Colors.white,
  });
  final double height;
  final double width;
  final String content;
  final Color color;
  final Color colorContent;
  Widget? leading;
  Widget? trainling;
  Function() onTap;
  @override
  State<BottomButtonCustom> createState() => _BottomButtonCustomState();
}

class _BottomButtonCustomState extends State<BottomButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        color: widget.color,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.leading != null) widget.leading! else const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.content,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: widget.colorContent),
              ),
            ),
            if (widget.trainling != null) widget.leading! else const SizedBox(),
          ],
        ),
      ),
    );
  }
}
