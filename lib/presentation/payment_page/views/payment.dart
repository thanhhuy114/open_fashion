import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../home_page/view/home_page_screen.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 20), () {
      setState(() {});
    });
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 555,
      width: 400,
      curve: Curves.easeInOut,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'PAYMENT SUCCESS',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      height: 0.5,
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        child: Lottie.asset(
                          'assets/lottie/star.json',
                          height: 110,
                        ),
                      ),
                      Align(
                        child: Lottie.asset(
                          'assets/lottie/payment_success.json',
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        'Your payment was success',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Payment ID 15263541',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110),
                    child: Image.asset('assets/images/3.png'),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Rate your purchase',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://res.cloudinary.com/dc4nkguls/image/upload/v1709807165/OpenFashion/icons/y0kwig32jlisggoexiot.png',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 26),
                              child: Image.network(
                                'https://res.cloudinary.com/dc4nkguls/image/upload/v1709807230/OpenFashion/icons/m3n9ycbdotu4eket0lxe.png',
                              ),
                            ),
                            Image.network(
                              'https://res.cloudinary.com/dc4nkguls/image/upload/v1709807260/OpenFashion/icons/xho1phpsu7802brwjgwz.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(),
                              minimumSize: const Size(double.infinity, 56),
                            ),
                            child: const Text(
                              'SUBMIT',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(),
                              side: const BorderSide(color: Color(0xffdedede)),
                              minimumSize: const Size(double.infinity, 56),
                            ),
                            onPressed: () async {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (final context) =>
                                      const HomePageScreen(),
                                ),
                                (final route) => false,
                              );
                            },
                            child: const Text(
                              'BACK TO HOME',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
