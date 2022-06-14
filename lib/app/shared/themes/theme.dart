import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/shared/colors.dart';

class Themes {
  static ThemeData get defaultTheme => ThemeData(
        backgroundColor: kBackgroundColor,
        primaryTextTheme: TextTheme(
          headline1: GoogleFonts.lato(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
          bodyText1: GoogleFonts.lato(
            fontSize: 19,
            fontWeight: FontWeight.normal,
            color: kTextColor,
          ),
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.lato(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
          bodyText1: GoogleFonts.lato(
            fontSize: 19,
            fontWeight: FontWeight.normal,
            color: kTextColor,
          ),
        ),
      );
}
