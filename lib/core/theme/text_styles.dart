import 'package:flutter/material.dart';

import 'font_family_helper.dart';

TextTheme textTheme() {
  return TextTheme(
    displaySmall: TextStyle(
      fontSize: 13,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 14,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(
      fontSize: 11,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.w800, // ExtraBold
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.w600, // SemiBold
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.w600, // SemiBold
    ),
    headlineLarge: TextStyle(
      fontSize: 15,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.w600, // SemiBold
    ),
    bodySmall: TextStyle(
      fontSize: 9,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.w800, // ExtraBold
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 21,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.w600, // SemiBold
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.w600, // SemiBold
    ),
    titleLarge: TextStyle(
      fontSize: 14,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.w600, // SemiBold
    ),
    labelSmall: TextStyle(
      fontSize: 17,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.w800, // ExtraBold
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      fontSize: 24,
      color: ColorTextStyle.geColorMode(),
      fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      fontWeight: FontWeight.w600, // SemiBold
    ),
  );
}
