import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:education/core/language/lang_keys.dart';
import 'package:education/features/home/cubit/home_cubit.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/widget polupar/categorise_course_popular.dart';
import '../widget/widget polupar/custom_widget_course_polupar.dart';

import 'package:flutter_svg/flutter_svg.dart';

class PoluparScrean extends StatelessWidget {
  const PoluparScrean({
    super.key,
    required this.maps,
  });
  final Map<String, dynamic> maps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            actions: [
              SvgPicture.asset(Assets.imagesSearchGray),
              horizontalSpace(13)
            ],
            title: Text(context.translate(LangKeys.popularCourses),
                style: context.textStyle.bodyLarge),
          ),
          SliverToBoxAdapter(
            child: BlocProvider.value(
              value: maps['cubit'] as HomeCubit,
              child: CategoriseCoursePopular(
                index: maps['index'],
              ),
            ),
          ),
          SliverFillRemaining(
            child: BlocProvider.value(
              value: maps['cubit'] as HomeCubit,
              child: const FilterCoursesBlocBuilder(),
            ),
          ),
        ],
      ),
    );
  }
}
