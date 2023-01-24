import 'package:bex_app_flutter/src/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

ThemeData themeLight(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    backgroundColor: ColorLight.background,
    cardColor: ColorLight.card,
    disabledColor: ColorLight.card,
    errorColor: ColorLight.error,
    hintColor: ColorLight.card,
    indicatorColor: ColorLight.primary,
    primaryColorLight: ColorLight.primary,
//    primaryColorDark: ColorLight.gold,
    primaryIconTheme: const IconThemeData(
      color: ColorLight.card,
    ),
    primaryColor: ColorLight.primary,
    textSelectionTheme: const TextSelectionThemeData(
        // cursorColor: ColorLight.gold,
        ),
    scaffoldBackgroundColor: ColorLight.background,

    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline1: GoogleFonts.poppins(
        color: ColorLight.card,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline2: GoogleFonts.poppins(
        color: ColorLight.card,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      headline3: GoogleFonts.poppins(
        color: ColorLight.card,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headline4: GoogleFonts.poppins(
        color: ColorLight.card,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      headline5: GoogleFonts.poppins(
        color: ColorLight.card,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: GoogleFonts.poppins(
        color: ColorLight.card,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: GoogleFonts.poppins(
        color: ColorLight.card,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      subtitle1: GoogleFonts.poppins(
        color: ColorLight.card,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      subtitle2: GoogleFonts.poppins(
        color: ColorLight.card,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      button: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
