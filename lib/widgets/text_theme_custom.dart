import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeCustom extends TextTheme {
  TextThemeCustom()
      : super(
          titleLarge: GoogleFonts.tenorSans(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: GoogleFonts.tenorSans(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: GoogleFonts.tenorSans(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: GoogleFonts.tenorSans(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          labelMedium: GoogleFonts.tenorSans(
            color: const Color.fromARGB(255, 31, 31, 31),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: GoogleFonts.tenorSans(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: GoogleFonts.tenorSans(
            color: const Color(0xFF888888),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        );
}
