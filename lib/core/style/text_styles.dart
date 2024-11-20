import 'package:flutter/material.dart';

import 'fonts/font_family_helper.dart';

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







// import 'package:flutter/material.dart';

// import 'fonts/font_family_helper.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

// abstract class AppTextStyles {
//   static TextStyle textStyle(double fontSize, FontWeight fontWeight) {
//     return TextStyle(
//       fontSize: fontSize,
//       color: ColorTextStyle.geColorMode(),
//       fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
//       fontWeight: fontWeight,
//     );
//   }

//   static TextTheme get textTheme => TextTheme(
//         displaySmall: textStyle(13.sp, FontWeight.bold),
//         displayMedium: textStyle(14.sp, FontWeight.bold),
//         displayLarge: textStyle(11.sp, FontWeight.w800), // ExtraBold
//         headlineSmall: textStyle(16.sp, FontWeight.w600), // SemiBold
//         headlineMedium: textStyle(18.sp, FontWeight.w600), // SemiBold
//         headlineLarge: textStyle(15.sp, FontWeight.w600), // SemiBold
//         bodySmall: textStyle(9.sp, FontWeight.w800), // ExtraBold
//         bodyMedium: textStyle(15.sp, FontWeight.bold),
//         bodyLarge: textStyle(21.sp, FontWeight.w600), // SemiBold
//         titleSmall: textStyle(12.sp, FontWeight.bold),
//         titleMedium: textStyle(15.sp, FontWeight.w600), // SemiBold
//         titleLarge: textStyle(14.sp, FontWeight.w600), // SemiBold
//         labelSmall: textStyle(17.sp, FontWeight.w800), // ExtraBold
//         labelMedium: textStyle(12.sp, FontWeight.bold),
//         labelLarge: textStyle(24.sp, FontWeight.w600), // SemiBold
//       );

//   // Helper method to set color and font family
// }
