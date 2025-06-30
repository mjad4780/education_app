import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../onpoarding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Education App',
        home: OnBoarding(),
        // onGenerateRoute: AppRoutes.onGenerateRoute,
        // initialRoute: getIt<CacheHelper>()
        //             .getData(key: Keys.onboarding) !=
        //         null
        //     ? getIt<CacheHelper>().getData(key: Keys.isLoggedIn) ?? false
        //         ? StringRoute.main
        //         : StringRoute.login
        //     : StringRoute.onBoarding,
      ),
    );
  }
}
