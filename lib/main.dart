import 'package:device_preview/device_preview.dart';
import 'package:education/app/education_app.dart';
import 'package:education/key.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/get_it/get_it.dart';
import 'core/helpers/cache_helper.dart';
import 'core/helpers/observer.dart';
import 'future/paymop/data/models/payment_data.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  setupServise();

  await getIt<CacheHelper>().init();
  await ScreenUtil.ensureScreenSize();
  // await Supabase.initialize(
  //   url: supabaseUrl,
  //   anonKey: supabaseKey,
  // );

  PaymentData.initialize(
    apiKey: apiKeyPaymop,
    iframeId: iframe,
    integrationCardId: cardId,
    integrationMobileWalletId: mobilId,
  );
//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//   OneSignal.initialize(onesignalId);
//   OneSignal.Notifications.requestPermission(true);

  runApp(
      DevicePreview(enabled: true, builder: (context) => const EducationApp()));
}
