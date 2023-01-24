import 'package:bex_app_flutter/src/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

ThemeData themeLight(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    backgroundColor: ColorLight.card,
    cardColor: ColorLight.card,
    disabledColor: ColorLight.card,
    errorColor: ColorLight.error,
    hintColor: ColorLight.card,
    indicatorColor: ColorLight.primary,
    primaryColorLight: ColorLight.primary,
    primaryIconTheme: const IconThemeData(
      color: ColorLight.card,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorLight.primary),
      ),
    ),
    primaryColor: ColorLight.primary,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: ColorLight.primary),
    scaffoldBackgroundColor: ColorLight.background,
    appBarTheme: const AppBarTheme(color: ColorLight.primary),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline1: GoogleFonts.poppins(
        color: ColorLight.fontgeneralColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline2: GoogleFonts.poppins(
        color: ColorLight.fontgeneralColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      headline3: GoogleFonts.poppins(
        color: ColorLight.fontgeneralColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headline4: GoogleFonts.poppins(
        color: ColorLight.fontgeneralColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      headline5: GoogleFonts.poppins(
        color: ColorLight.fontgeneralColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: GoogleFonts.poppins(
        color: ColorLight.primary,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: GoogleFonts.poppins(
        color: ColorLight.fontgeneralColor,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      subtitle1: GoogleFonts.poppins(
        color: ColorLight.fontgeneralColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      subtitle2: GoogleFonts.poppins(
        color: ColorLight.primary,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      button: GoogleFonts.poppins(
        color: ColorLight.card,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
