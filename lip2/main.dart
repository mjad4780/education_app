import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // Bloc.observer = MyBlocObserver();
  // setupServise();
  // await getIt<ConnectivityController>().init();

  // await getIt<CacheHelper>().init();

  // await ScreenUtil.ensureScreenSize();

  // await Supabase.initialize(
  //   url: supabaseUrl,
  //   anonKey: supabaseKey,
  // );
  // ErrorWidget.builder = (FlutterErrorDetails details) => ModernErrorScreen(
  //       errorDetails: details,
  //     );
  // Handle Flutter errors here

  // await tesHomeData();
  // await getCourseDetails(101);
  // PaymentData.initialize(
  //   apiKey: apiKeyPaymop,
  //   iframeId: iframe,
  //   integrationCardId: cardId,
  //   integrationMobileWalletId: mobilId,
  // );
//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//   OneSignal.initialize(onesignalId);
//   OneSignal.Notifications.requestPermission(true);
  // await _splashChannel.invokeMethod('hideSplash');

  runApp(DevicePreview(enabled: true, builder: (context) => const App()));
}
