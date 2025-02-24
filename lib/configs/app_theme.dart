import 'package:crypto_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //? light theme config
  ThemeData lightThemeData = ThemeData(
    fontFamily: "poppins",
    scaffoldBackgroundColor: whiteColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: purpleColor,
      onPrimary: blackColor,
      secondary: purpleColor,
      onSecondary: blackColor,
      error: redColor,
      onError: whiteColor,
      surface: whiteColor,
      onSurface: blackColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: purpleColor,
        foregroundColor: whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: blackColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: boneColor),
    cardColor: boneColor,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: greyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: greyColor),
      ),
      labelStyle: TextStyle(color: greyColor),
    ),
  );

  //? dark theme config
  ThemeData darkThemeData = ThemeData(
    fontFamily: "poppins",
    scaffoldBackgroundColor: darkColor,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: purpleColor,
      onPrimary: whiteColor,
      secondary: purpleColor,
      onSecondary: blackColor,
      error: redColor,
      onError: whiteColor,
      surface: blackColor,
      onSurface: blackColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: purpleColor,
        foregroundColor: whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: whiteColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: blackGreyColor),
    cardColor: darkGreyColor,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: greyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: greyColor),
      ),
      labelStyle: TextStyle(color: greyColor),
    ),
  );
}
