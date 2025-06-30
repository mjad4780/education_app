import 'package:education/core/Router/route_string.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/future/Qiez/view/exam_questions.dart';
import 'package:education/future/auth/login/login_screan.dart';
import 'package:education/future/auth/sign%20up/logic/cubit/sign_up_cubit.dart';
import 'package:education/future/chats/screan_chats.dart';
import 'package:education/future/home/ui/castegories_screan.dart';
import 'package:education/future/home/ui/home_scean.dart';
import 'package:education/future/home/ui/notification_screen.dart';
import 'package:education/future/mentor%20detalais/widget/screen_detalias_chat_mentors.dart';
import 'package:education/future/onboarding/onboarding_view.dart';
import 'package:education/future/profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../future/Qiez/cubit/exam_cubit.dart';
import '../../future/Qiez/view/exam_answers.dart';
import '../../future/Qiez/view/exam_overview_page.dart';
import '../../future/Qiez/view/exam_report_screen.dart';
import '../../future/auth/sign up/sign_up.dart';
import '../../future/chats/widget/screen_detalias_chat.dart';
import '../../future/course detaias/course_details.dart';
import '../../future/course detaias/widget/pdf_view.dart';
import '../../future/home/data/model/response_home/course.dart';
import '../../future/home/data/model/response_home/mentor.dart';
import '../../future/home/ui/mentor_screen.dart';
import '../../future/home/ui/polupar_screan.dart';
import '../../future/home/ui/search_screen.dart';
import '../../future/main/screan_main.dart';
import '../../future/mentor detalais/mentor_detalias.dart';
import '../../future/profile/ui/screen_edit_profile.dart';
import '../../future/profile/ui/screen_language.dart';
import '../../future/splash/ui/screens/splash_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case StringRoute.onBoarding:
        return BaseRoute(
          page: const OnboardingView(),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.login:
        return BaseRoute(
          page: const LoginScrean(),
          transitionType: RouteTransitionType.slideRight,
        );
      case StringRoute.signUp:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
          transitionType: RouteTransitionType.slideLeft,
        );

      case StringRoute.home:
        return BaseRoute(
          page: const HomeScrean(),
          transitionType: RouteTransitionType.fade,
        );
      case StringRoute.splash:
        return BaseRoute(
          page: const SplashScreen(),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.main:
        return BaseRoute(
          page: const MainView(),
          transitionType: RouteTransitionType.scale,
        );
      case StringRoute.screanChatsMentors:
        return BaseRoute(
          page: ScreenChatMentors(
            mentorId: args as int,
          ),
          transitionType: RouteTransitionType.slideRight,
        );
      case StringRoute.categories:
        return BaseRoute(
          page: CategoreisScrean(
            data: args as Map<String, dynamic>,
          ),
          transitionType: RouteTransitionType.slideUp,
        );
      case StringRoute.courseDetailsScrean:
        return BaseRoute(
          page: CourseDetailsScreen(
            course: args as Course,
          ),
          transitionType: RouteTransitionType.slideLeft,
        );
      case StringRoute.poluparScrean:
        return BaseRoute(
          page: PoluparScrean(
            maps: args as Map<String, dynamic>,
          ),
          transitionType: RouteTransitionType.slideUp,
        );
      case StringRoute.mentorScreen:
        return BaseRoute(
          page: MentorScreen(
            mentors: args as List<Mentor>?,
          ),
          transitionType: RouteTransitionType.slideRight,
        );
      case StringRoute.mentorDetalias:
        return BaseRoute(
          page: MentorDetails(mentor: args as Mentor),
          transitionType: RouteTransitionType.slideRight,
        );
      case StringRoute.screenChatsDetalias:
        return BaseRoute(
          page: ScreenChatsDetails(argument: args as Map<String, dynamic>),
          transitionType: RouteTransitionType.slideDown,
        );
      case StringRoute.screenLanguage:
        return BaseRoute(
          page: const ScreenLanguage(),
          transitionType: RouteTransitionType.slideLeft,
        );

      case StringRoute.screanChats:
        return BaseRoute(
          page: const ScreanChats(),
          transitionType: RouteTransitionType.slideRight,
        );
      case StringRoute.notificationScreen:
        return BaseRoute(
          page: const NotificationScreen(),
          transitionType: RouteTransitionType.slideDown,
        );
      case StringRoute.pdfViewerScreen:
        return BaseRoute(
          page: PdfViewerScreen(
            pdfPath: args as String,
          ),
          transitionType: RouteTransitionType.scale,
        );
      //
      case StringRoute.examQuestionsPage:
        return BaseRoute(
          page: ExamQuestionsPage(
            examCubit: args as ExamCubit,
          ),
          transitionType: RouteTransitionType.slideLeft,
        );

      case StringRoute.examOverviewPage:
        return BaseRoute(
          page: const ExamOverviewPage(),
          transitionType: RouteTransitionType.slideUp,
        );
      case StringRoute.examAnswers:
        return BaseRoute(
          page: ExamAnswers(
            examCubit: args as ExamCubit,
          ),
          transitionType: RouteTransitionType.rotation,
        );
      case StringRoute.examReportScreen:
        return BaseRoute(
          page: ExamReportScreen(examCubit: args as ExamCubit),
          transitionType: RouteTransitionType.size,
        );
      case StringRoute.searchScreen:
        return BaseRoute(
          page: const SearchScreen(),
          transitionType: RouteTransitionType.slideDown,
        );

      case StringRoute.screenEditProfile:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const ScreenEditProfile(),
          ),
          transitionType: RouteTransitionType.slideRight,
        );
      default:
        return BaseRoute(
          page: const Scaffold(),
          transitionType: RouteTransitionType.fade,
        );
    }
  }
}
