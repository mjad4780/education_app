// import 'package:dio/dio.dart';

import 'package:dio/dio.dart';
import 'package:education/app/education_cubit/education_cubit.dart';
import 'package:education/core/helpers/connectivity_controller.dart';
import 'package:education/core/service/supabase/chat/chat_service.dart';
import 'package:education/core/service/supabase/home_service/supabase_services_home.dart';
import 'package:education/features/chats/cubit/chats_cubit.dart';
import 'package:education/features/chats/data/repo/chat_repo.dart';
import 'package:education/features/courses/data/repo_my_course.dart';
import 'package:education/features/home/data/repo/repo_home.dart';
import 'package:education/features/main/cubit/main_cubit.dart';
import 'package:education/features/mentor_detalais/data/repo_courses_mentor.dart';
import 'package:education/features/paymop/logic/paymop_cubit.dart';
import 'package:education/core/service/paymop/service_paymop.dart';
import 'package:education/features/qiez/cubit/exam_cubit.dart';
import 'package:education/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:education/features/course_detaias/cubit/video_course_cubit.dart';
import 'package:education/features/courses/cubit/my_course_cubit.dart';
import 'package:education/features/home/cubit/home_cubit.dart';
import 'package:education/features/mentor_detalais/logic/cubit/mentor_cubit.dart';
import 'package:education/features/profile/logic/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timer_count_down/timer_controller.dart';

// import '../../core/networking/api_service.dart';
// import '../../core/networking/dio_factory.dart';

import '../../features/auth/login/data/repo.dart';
import '../../features/auth/sign up/data/sign_up_repo.dart';
import '../../features/auth/sign up/logic/cubit/sign_up_cubit.dart';
import '../../features/course_detaias/data/repo/repo_video.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../key.dart';
import '../helpers/cache_helper.dart';
import '../../features/paymop/data/repo.dart';
import '../service/supabase/auth/auth_servieces.dart';
import '../service/supabase/auth/supabase_services_impl.dart';
import '../service/dio/dio_factory.dart';
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
  getIt.registerLazySingleton<SupabaseService>(() => SupabaseService(getIt()));
  getIt.registerLazySingleton<SupabaseChatService>(
      () => SupabaseChatService(getIt()));

  getIt.registerLazySingleton<ConnectivityController>(
      () => ConnectivityController.instance);
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt(), getIt()));
  getIt.registerLazySingleton<SupabaseServiceHome>(
      () => SupabaseServiceHome(getIt()));

  getIt.registerLazySingleton<RepoMyCourse>(() => RepoMyCourse(getIt()));

  getIt.registerFactory<MyCourseCubit>(() => MyCourseCubit(getIt()));
  // Dio dio = DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // getIt.registerLazySingleton<SupabaseServiceHome>(() => SupabaseServiceHome(getIt()));
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  getIt.registerFactory<EducationCubit>(() => EducationCubit());

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // SignUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));

  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // profile
  getIt.registerLazySingleton<ProfileRepoImpl>(
      () => ProfileRepoImpl(getIt(), getIt()));

  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

  //mentor
  getIt.registerLazySingleton<RepoCoursesMentor>(() => RepoCoursesMentor(
        getIt(),
      ));

  getIt.registerFactory<MentorCubit>(() => MentorCubit(
        getIt(),
      ));

  //VideoCourseCubits
  getIt.registerLazySingleton<VideoService>(() => VideoService(dio));

  getIt.registerLazySingleton<RepoVideo>(() => RepoVideo(getIt(), getIt()));

  getIt.registerFactory<VideoCourseCubit>(() => VideoCourseCubit(
        getIt(),
      ));

  /// exams
  getIt.registerLazySingleton<CountdownController>(
      () => CountdownController(autoStart: true));

  getIt.registerFactory<ExamCubit>(() => ExamCubit(getIt()));

  ///home

  getIt.registerLazySingleton<RepoHome>(() => RepoHome(
        getIt(),
      ));

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  ///MyCourse

  ///paymop
  getIt.registerLazySingleton<ServicePaymop>(() => ServicePaymop(dio));
  getIt.registerLazySingleton<RepoPaymop>(() => RepoPaymop(getIt()));
  getIt.registerLazySingleton<PaymopCubit>(() => PaymopCubit(getIt(), getIt()));

  // ///notification
  // getIt.registerLazySingleton<NotificationService>(
  //     () => NotificationService(dio));
  ////chat
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(getIt()));
  getIt.registerFactory<ChatsCubit>(() => ChatsCubit(getIt()));

//   MAIN
  getIt.registerFactory<MainCubit>(() => MainCubit());
}
