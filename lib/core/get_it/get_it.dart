// import 'package:dio/dio.dart';

import 'package:dio/dio.dart';
import 'package:education/app/education_cubit/education_cubit.dart';
import 'package:education/core/helpers/connectivity_controller.dart';
import 'package:education/core/service/home_service/supabase_services_Home.dart';
import 'package:education/future/home/data/repo/repo_home.dart';
import 'package:education/future/paymop/logic/paymop_cubit.dart';
import 'package:education/core/service/paymop/service_paymop.dart';
import 'package:education/future/Qiez/cubit/exam_cubit.dart';
import 'package:education/future/auth/login/logic/cubit/login_cubit.dart';
import 'package:education/future/course%20detaias/cubit/video_course_cubit.dart';
import 'package:education/future/courses/cubit/my_course_cubit.dart';
import 'package:education/future/home/cubit/home_cubit.dart';
import 'package:education/future/mentor%20detalais/logic/cubit/mentor_cubit.dart';
import 'package:education/future/profile/logic/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timer_count_down/timer_controller.dart';

// import '../../core/networking/api_service.dart';
// import '../../core/networking/dio_factory.dart';

import '../../future/auth/login/data/repo.dart';
import '../../future/auth/sign up/data/sign_up_repo.dart';
import '../../future/auth/sign up/logic/cubit/sign_up_cubit.dart';
import '../../future/course detaias/data/repo/repo_video.dart';
import '../../key.dart';
import '../helpers/cache_helper.dart';
import '../../future/paymop/data/repo.dart';
import '../service/auth/auth_servieces.dart';
import '../service/auth/supabase_services_impl.dart';
import '../service/dio/dio_factory.dart';
import '../service/notification/send_notification.dart';
import '../service/video_hundle/video_service.dart';

final getIt = GetIt.instance;
void setupServise() {
  ///AuthService
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn(
        clientId: clientIdAndoid,
        serverClientId: clientIdWep,
      ));
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerLazySingleton<SupabaseServiceHome>(
      () => SupabaseServiceHome(getIt()));
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

  // profile
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());

  //mentor
  getIt.registerFactory<MentorCubit>(() => MentorCubit());

  //VideoCourseCubits
  getIt.registerLazySingleton<VideoService>(() => VideoService(dio));

  getIt.registerLazySingleton<RepoVideo>(() => RepoVideo(getIt(), getIt()));

  getIt.registerFactory<VideoCourseCubit>(() => VideoCourseCubit(getIt()));

  /// exams
  getIt.registerLazySingleton<CountdownController>(
      () => CountdownController(autoStart: true));

  getIt.registerFactory<ExamCubit>(() => ExamCubit(getIt()));

  ///home
  getIt.registerLazySingleton<ConnectivityController>(
      () => ConnectivityController.instance);

  getIt.registerLazySingleton<RepoHome>(() => RepoHome(
        getIt(),
      ));

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  ///MyCourse
  getIt.registerFactory<MyCourseCubit>(() => MyCourseCubit());

  ///paymop
  getIt.registerLazySingleton<ServicePaymop>(() => ServicePaymop(dio));
  getIt.registerLazySingleton<RepoPaymop>(() => RepoPaymop(getIt()));
  getIt.registerFactory<PaymopCubit>(() => PaymopCubit(getIt()));

  ///notification
  getIt.registerLazySingleton<NotificationService>(
      () => NotificationService(dio));
}
