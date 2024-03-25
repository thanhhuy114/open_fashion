// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageTrending extends StatelessWidget {
  const HomePageTrending({super.key});
  @override
  Widget build(final BuildContext context) {
    final List lstTrending1 = ['2021', 'spring', 'collection', 'fall'];

    final List lstTrending2 = ['dress', 'autumncollection', 'openfashion'];
    return Column(
      children: [
        Text(
          '@TRENDING',
          style: GoogleFonts.tenorSans(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            letterSpacing: 4,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: lstTrending1.asMap().entries.map((final e) {
            return Container(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 249, 249, 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                '#${e.value}',
                style: GoogleFonts.tenorSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 0.01,
                ),
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: lstTrending2.asMap().entries.map((final e) {
            return Container(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 249, 249, 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                '#${e.value}',
                style: GoogleFonts.tenorSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 0.01,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
