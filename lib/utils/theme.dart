import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_dish_driver/utils/AppColors.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: appThemeColor,
  primarySwatch: appThemeColor,
  scaffoldBackgroundColor: AppColors.backgroundblueColour,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
  fontFamily: GoogleFonts.poppins().fontFamily,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    labelLarge: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    bodyLarge: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    titleMedium: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    titleSmall: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    titleLarge: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    labelMedium: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
    labelSmall: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    displayLarge: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
    bodySmall: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    // foregroundColor: AppColors.theme,
    surfaceTintColor: AppColors.white,
    // systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: AppColors.theme),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(AppColors.theme),
    foregroundColor: MaterialStatePropertyAll(AppColors.backgroundblueColour),
  )),
  // textSelectionTheme: TextSelectionThemeData(cursorColor: greyNav),
  inputDecorationTheme: InputDecorationTheme(
    // filled: true,
    // fillColor: Colors.white,

    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.theme),
        borderRadius: BorderRadius.circular(100.0)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
    ),
    contentPadding: const EdgeInsets.all(12.0),
    hintStyle: GoogleFonts.poppins(fontSize: 14.0, color: AppColors.grey),
    labelStyle: GoogleFonts.poppins(fontSize: 14.0, color: Colors.black),
  ),
);
