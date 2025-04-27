import 'package:education/app/education_cubit/education_cubit.dart';
import 'package:education/core/Router/route_string.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/Router/route.dart';
import '../core/language/app_localizations_setup.dart';
import '../core/style/theme/app_theme.dart';

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

class EducationApp extends StatelessWidget {
  const EducationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EducationCubit>()..changeFullAppThemeMode(),
      child: BlocBuilder<EducationCubit, EducationState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              theme: context.read<EducationCubit>().isDark
                  ? themeLight()
                  : themeDark(),
              locale: Locale(context.read<EducationCubit>().currentLangCode),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              navigatorObservers: [routeObserver],
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              debugShowCheckedModeBanner: false,
              title: 'Education App',
              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: getIt<CacheHelper>()
                          .getData(key: Keys.onboarding) !=
                      null
                  ? getIt<CacheHelper>().getData(key: Keys.isLoggedIn) ?? false
                      ? StringRoute.main
                      : StringRoute.login
                  : StringRoute.onBoarding,
            ),
          );
        },
      ),
    );
  }
}
