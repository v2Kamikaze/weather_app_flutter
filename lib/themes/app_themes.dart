import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/themes/app_colors.dart';

final appTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: TextTheme(
    headline1: GoogleFonts.roboto(
      fontSize: 94,
      color: Colors.white,
      fontWeight: FontWeight.w200,
      letterSpacing: -8,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 34,
      color: Colors.white,
      fontWeight: FontWeight.w400,
      letterSpacing: -2,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 20,
      color: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.w500,
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.background2,
  ),
);
