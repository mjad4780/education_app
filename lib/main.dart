import 'package:device_preview/device_preview.dart';
import 'package:education/app/education_app.dart';
import 'package:education/core/helpers/connectivity_controller.dart';
import 'package:education/key.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/get_it/get_it.dart';
import 'core/helpers/cache_helper.dart';
import 'core/helpers/observer.dart';
// import 'future/paymop/data/models/payment_data.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  setupServise();
  await getIt<ConnectivityController>().init();

  await getIt<CacheHelper>().init();

  await ScreenUtil.ensureScreenSize();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
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

  runApp(DevicePreview(
      enabled: false, builder: (context) => const EducationApp()));
}

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Name'),
        ),
        body: const Center(
          child: Text('Name'),
        ),
      ),
    );
  }
}
