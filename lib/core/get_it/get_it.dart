// import 'package:dio/dio.dart';

import 'package:education/app/education_cubit/education_cubit.dart';
import 'package:education/future/auth/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// import '../../core/networking/api_service.dart';
// import '../../core/networking/dio_factory.dart';

import '../../future/auth/login/data/repo.dart';
import '../../future/auth/sign up/data/sign_up_repo.dart';
import '../../future/auth/sign up/logic/cubit/sign_up_cubit.dart';
import '../../key.dart';
import '../helpers/cache_helper.dart';
import '../service/auth/auth_servieces.dart';
import '../service/auth/supabase_services_impl.dart';

final getIt = GetIt.instance;
void setupServise() {
  ///AuthService
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn(
        clientId: clientIdAndoid,
        serverClientId: clientIdWep,
      ));
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerLazySingleton<SupabaseService>(() => SupabaseService(getIt()));
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt(), getIt()));

  // Dio dio = DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  getIt.registerFactory<EducationCubit>(() => EducationCubit());

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // SignUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));

  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  //
}
