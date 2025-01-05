import 'package:device_preview/device_preview.dart';
import 'package:education/app/education_app.dart';
import 'package:education/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/get_it/get_it.dart';
import 'core/helpers/cache_helper.dart';
import 'core/helpers/observer.dart';
import 'core/packege payment/payment_data.dart';
// import 'key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupServise();
  await getIt<CacheHelper>().init();
  await ScreenUtil.ensureScreenSize();
  // await Supabase.initialize(
  //   url: supabaseUrl,
  //   anonKey: supabaseKey,
  // );
  PaymentData.initialize(
    // userData: UserData(phone: '01021026482'),
    apiKey:
        apiKeyPaymop, // Required: Found under Dashboard -> Settings -> Account Info -> API Key
    iframeId: iframe, // Required: Found under Developers -> iframes
    integrationCardId:
        cardId, // Required: Found under Developers -> Payment Integrations -> Online Card ID
    integrationMobileWalletId:
        mobilId, // Required: Found under Developers -> Payment Integrations -> Mobile Wallet ID
  );

  runApp(
      DevicePreview(enabled: true, builder: (context) => const EducationApp()));
}
