import '../../../utility/constant.dart';
import '../../get_it/get_it.dart';
import '../../helpers/cache_helper.dart';

class FontFamilyHelper {
  const FontFamilyHelper._();

  static const String cairoArabic = 'Cairo';

  static const String poppinsEnglish = 'Mulish';

  static String geLocalozedFontFamily() {
    if (getIt<CacheHelper>().getData(key: Keys.language) == 'en') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }
}
