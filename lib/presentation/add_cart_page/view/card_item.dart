import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.cardNumber,
    required this.expDate,
    required this.cardName,
    this.cardLogoUrl,
    this.backgroundColor = Colors.black,
  });
  final String cardNumber;
  final String expDate;
  final String cardName;
  final String? cardLogoUrl;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 190,
      margin: const EdgeInsets.only(right: 10, left: 10),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo Card
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/Mastercard.png',
                width: 52.15,
                height: 32,
              ),
            ],
          ),

          //Name of card and expdate
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cardName,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    expDate,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),

              //Number of card
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cardNumber,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
