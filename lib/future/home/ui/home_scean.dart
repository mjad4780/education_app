import 'package:education/core/get_it/get_it.dart';
import 'package:education/future/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/categories_course.dart';
import '../widget/custom_polupar_course.dart';
import '../widget/custom_widget_course.dart';
import '../widget/heading_app.dart';
import '../widget/mentor.dart';
import '../widget/poster_app.dart';
import '../widget/search_app.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});
  // await AuthService.logout();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            HeadingApp(),
            SearchApp(),
            PosterApp(),
            CustomCategoriesCourse(),
            CustomPoluparCourse(),
            CustomWidgetCourse(),
            CustomMentor()
          ],
        ),
      ),
    );
  }
}
