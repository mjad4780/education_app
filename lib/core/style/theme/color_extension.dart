import 'package:flutter/material.dart';

import '../colors/colors_dark.dart';
import '../colors/colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.mainColor,
    required this.bluePinkDark,
  });

  final Color? mainColor;
  final Color? bluePinkDark;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? mainColor,
    Color? bluePinkDark,
  }) {
    return MyColors(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
    );
  }

  static const MyColors dark = MyColors(
    mainColor: ColorsDark.mainColor,
    bluePinkDark: ColorsDark.blueDark,
  );

  static const MyColors light = MyColors(
    mainColor: ColorsLight.mainColor,
    bluePinkDark: ColorsLight.pinkDark,
  );
}
