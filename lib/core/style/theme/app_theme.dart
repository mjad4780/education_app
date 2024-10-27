import 'package:flutter/material.dart';

import '../colors/colors_dark.dart';
import '../colors/colors_light.dart';
import 'color_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.dark,
    ],
    useMaterial3: true,
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
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.light,
    ],
    useMaterial3: true,
    // textTheme: TextTheme(displaySmall: TextStyles.textStyle18
    //   TextStyle(
    //     fontSize: 14,
    //     color: ColorsLight.pinkLight,
    //     fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
    //   ),
    // ),
  );
}
