import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utility/constant.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(EducationInitial());

  bool isDark = getIt<CacheHelper>().getData(key: Keys.themeMode) ?? false;

  String currentLangCode =
      getIt<CacheHelper>().getData(key: Keys.language) ?? 'en';

//Theme Mode

  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(ThemeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      getIt<CacheHelper>()
          .saveData(key: Keys.themeMode, value: isDark)
          .then((value) {
        emit(ThemeChangeMode(isDark: isDark));
      });
    }
  }

  Future<void> changeFullAppThemeMode({bool? sharedMode}) async {
    if (getIt<CacheHelper>().getData(key: Keys.themeMode) == null) {
      changeAppThemeMode();
    }
  }

//Language Change
  void getSavedLanguage() {
    currentLangCode = getIt<CacheHelper>().getData(key: Keys.language) ?? 'ar';

    emit(LanguageChange(locale: Locale(currentLangCode)));
  }

  void _changeLang(String langCode) {
    getIt<CacheHelper>().saveData(key: Keys.language, value: langCode);

    currentLangCode = langCode;
    emit(LanguageChange(locale: Locale(currentLangCode)));
  }

  void toArabic() => _changeLang('ar');

  void toEnglish() => _changeLang('en');
}
