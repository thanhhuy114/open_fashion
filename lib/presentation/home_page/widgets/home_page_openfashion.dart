import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageOpenFashion extends StatelessWidget {
  const HomePageOpenFashion({super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      color: const Color.fromRGBO(242, 242, 242, 1),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset(
              width: 97.61,
              height: 40,
              'assets/img/Logo.png',
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            width: 283.04,
            height: 65.63,
            child: Text(
              textAlign: TextAlign.center,
              'Making a luxurious lifestyle accessible for a generous group of women is our daily drive.',
              style: GoogleFonts.tenorSans(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: 0.01,
              ),
            ),
          ),
          Image.asset('assets/img/3.png'),
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 165,
                    height: 86.88,
                    child: Column(
                      children: [
                        Image.asset('assets/img/Miroodles Sticker.png'),
                        Text(
                          r'Fast shipping. Free on orders over $25.',
                          style: GoogleFonts.tenorSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    height: 81.8,
                    child: Column(
                      children: [
                        Image.asset('assets/img/Miroodles Sticker (2).png'),
                        Text(
                          'Unique designs\nand high-quality materials.',
                          style: GoogleFonts.tenorSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 165,
                    height: 86.88,
                    child: Column(
                      children: [
                        Image.asset('assets/img/Miroodles Sticker (1).png'),
                        Text(
                          'Sustainable process from start to finish.',
                          style: GoogleFonts.tenorSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    height: 81.8,
                    child: Column(
                      children: [
                        Image.asset('assets/img/Miroodles Sticker (3).png'),
                        Text(
                          r'Fast shipping. Free on orders over $25.',
                          style: GoogleFonts.tenorSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0,bottom: 20),
            child: Image.asset('assets/img/noise.png'),
          ),
        ],
      ),
    );
  }
}
