part of 'education_cubit.dart';

sealed class EducationState {}

final class EducationInitial extends EducationState {}

final class LanguageChange extends EducationState {
  final Locale locale;

  LanguageChange({required this.locale});
}

final class ThemeChangeMode extends EducationState {
  final bool isDark;

  ThemeChangeMode({required this.isDark});
}
