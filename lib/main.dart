import 'package:device_preview/device_preview.dart';
import 'package:education/app/education_app.dart';
import 'package:flutter/material.dart';
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
  //   await Supabase.initialize(
  //   url: SUPABASE_URL,
  //   anonKey: SUPABASE_ANON_KEY,
  // );
  runApp(DevicePreview(
      enabled: false, builder: (context) => const EducationApp()));
}
