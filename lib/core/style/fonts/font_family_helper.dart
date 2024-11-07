import 'package:education/core/style/colors.dart';
import 'package:flutter/material.dart';

import '../../../utility/constant.dart';
import '../../get_it/get_it.dart';
import '../../helpers/cache_helper.dart';

class FontFamilyHelper {
  const FontFamilyHelper._();

  static const String cairoArabic = 'Cairo';

  static const String poppinsEnglish = 'Mulish';

  static String geLocalozedFontFamily() {
    if (getIt<CacheHelper>().getData(key: Keys.language) == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }
}

class ColorTextStyle {
  const ColorTextStyle._();

  static Color geColorMode() {
    if (getIt<CacheHelper>().getData(key: Keys.themeMode)) {
      return AppColorDarkMode.moreLightGray;
    } else {
      return AppColorligth.moreLightGray;
    }
  }
}
