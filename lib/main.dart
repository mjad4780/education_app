import 'package:education/app/education_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/get_it/get_it.dart';
import 'core/helpers/cache_helper.dart';
import 'core/helpers/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupServise();
  await getIt<CacheHelper>().init();
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const EducationApp());
  });
}
