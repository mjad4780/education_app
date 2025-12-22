import 'package:education/core/extensions/color_extension.dart';
import 'package:education/core/theme/text_styles.dart';
import 'package:education/core/util/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: AppColorDarkMode.greyLight,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.dark,
    ],
    useMaterial3: true,
    textTheme: textTheme(),
  );
}

ThemeData themeLight() {
  return ThemeData(
      scaffoldBackgroundColor: AppColorligth.greyLight,
      extensions: const <ThemeExtension<dynamic>>[
        MyColors.light,
      ],
      useMaterial3: true,
      textTheme: textTheme());
}
