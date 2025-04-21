import 'package:education/future/home/data/model/response_home/category.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/data/model/response_home/mentor.dart';
import 'package:education/utility/loading.dart';
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
          current is LoadingHome ||
          current is EmitgetDataHome ||
          current is FailerGetDataHome,
      builder: (_, state) {
        if (state is LoadingHome) {
          return loadingHome(state);
        } else if (state is FailerGetDataHome) {
          return Center(child: Text(state.messege));
        } else if (state is EmitgetDataHome) {
          return SingleChildScrollView(
              child: Column(
            children: [
              const HeadingApp(),
              const SearchApp(),
              const PosterApp(),
              CustomCategoriesCourse(
                categories: state.responseHome.categories!,
              ),
              CustomPoluparCourse(
                course: state.responseHome.courses!,
                categories: state.responseHome.categories!,
              ),
              CoursesBlocBuilder(
                courses: state.responseHome.courses!,
              ),
              CustomMentor(
                mentors: state.responseHome.mentors!,
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
        const LoadingWidget(child: HeadingApp()),
        const LoadingWidget(child: SearchApp()),
        const Skeletonizer(
            child: Skeleton.shade(shade: true, child: PosterApp())),
        const Skeletonizer(
            child: Skeleton.shade(
                child: CustomCategoriesCourse(
          categories: [],
        ))),
        LoadingWidget(
            child: CustomPoluparCourse(
          course: [Course()],
          categories: [Category(), Category(), Category(), Category()],
        )),
        LoadingWidget(
            child: CustomWidgetCourse(
          courses: [Course(), Course(), Course(), Course()],
        )),
        LoadingWidget(
            child: CustomMentor(
          mentors: [Mentor(), Mentor(), Mentor(), Mentor()],
        ))
      ],
    ));
  }
}
//loding                 categories: [Category()]
