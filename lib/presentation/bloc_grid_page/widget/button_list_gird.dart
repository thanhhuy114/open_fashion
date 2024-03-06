import 'package:flutter/material.dart';

class ButtonListAndGird extends StatelessWidget {
  const ButtonListAndGird({
    super.key,
    required this.seletedMod,
    required this.onTap,
  });

  final bool seletedMod;
  final Function() onTap;

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: 35,
      width: 65,
      decoration: BoxDecoration(
        color: const Color(0xFFe9e9e9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: const Color(0xFFe4e7ea),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton(
            assets: 'assets/images/list.png',
            onTap: onTap,
            isSelected: seletedMod,
          ),
          _buildButton(
            assets: 'assets/images/grid.png',
            onTap: onTap,
            isSelected: !seletedMod,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required final String assets,
    required final Function() onTap,
    required final bool isSelected,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 255, 255, 255) : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(
          assets,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
