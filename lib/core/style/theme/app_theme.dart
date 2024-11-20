import 'package:flutter/material.dart';

import '../colors.dart';
import '../text_styles.dart';
import 'color_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: AppColorDarkMode.greyLight,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.dark,
    ],
    useMaterial3: true,
    textTheme: textTheme(),

    // textTheme: TextTheme(
    //   displaySmall: TextStyle(
    //     fontSize: 14,
    //     color: ColorsDark.white,
    //     fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
    //   ),
    // ),
  );
}

ThemeData themeLight() {
  return ThemeData(
      scaffoldBackgroundColor: AppColorligth.greyLight,
      extensions: const <ThemeExtension<dynamic>>[
        MyColors.light,
      ],
      useMaterial3: true,
      textTheme: textTheme()

      // textTheme: TextTheme(displaySmall: TextStyles.textStyle18
      //   TextStyle(
      //     fontSize: 14,
      //     color: ColorsLight.pinkLight,
      //     fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      //   ),
      // ),
      );
}
