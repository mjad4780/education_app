import 'package:education/future/home/data/model/response_home/category.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/data/model/response_home/mentor.dart';
import 'package:skeletonizer/skeletonizer.dart';

import './categories_course.dart';
import './custom_polupar_course.dart';
import './custom_widget_course.dart';
import './heading_app.dart';
import './mentor.dart';
import './poster_app.dart';
import './search_app.dart';
import 'package:education/future/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocBuilder extends StatelessWidget {
  const HomeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is LoadingHome || current is EmitgetDataHome,
      builder: (_, state) {
        if (state is LoadingHome) {
          return loadingHome(state);
        } else if (state is EmitgetDataHome) {
          return SingleChildScrollView(
              child: Column(
            children: [
              const HeadingApp(),
              const SearchApp(),
              const PosterApp(),
              CustomCategoriesCourse(
                categories: state.responseHome.platform!.categories!,
              ),
              CustomPoluparCourse(
                course: state.responseHome.platform!.courses!,
                categories: state.responseHome.platform!.categories!,
              ),
              CustomWidgetCourse(
                courses: state.responseHome.platform!.courses!,
              ),
              CustomMentor(
                mentors: state.responseHome.platform!.mentors!,
              )
            ],
          ));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  SingleChildScrollView loadingHome(LoadingHome state) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const Skeletonizer(child: HeadingApp()),
        const Skeletonizer(child: SearchApp()),
        const Skeletonizer(child: PosterApp()),
        Skeletonizer(
            child: CustomCategoriesCourse(
          categories: [Category(), Category(), Category(), Category()],
        )),
        Skeletonizer(
            child: CustomPoluparCourse(
          course: [Course()],
          categories: [Category(), Category(), Category(), Category()],
        )),
        Skeletonizer(
            child: CustomWidgetCourse(
          courses: [Course(), Course(), Course(), Course()],
        )),
        Skeletonizer(
            child: CustomMentor(
          mentors: [Mentor(), Mentor(), Mentor(), Mentor()],
        ))
      ],
    ));
  }
}
//loding                 categories: [Category()]
