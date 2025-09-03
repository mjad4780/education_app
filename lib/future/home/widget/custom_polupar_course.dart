import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/home/cubit/home_cubit.dart';
import 'package:education/future/home/data/model/response_home/category.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Router/route_string.dart';
import '../../../core/language/lang_keys.dart';

class CustomPoluparCourse extends StatelessWidget {
  const CustomPoluparCourse(
      {super.key, required this.categories, required this.course});
  final List<Category> categories;
  final List<Course> course;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, int>(
      selector: (state) => state is UpdateCurrentIndex ? state.index : -1,
      builder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(context.translate(LangKeys.popularCourses),
                      style: context.textStyle.headlineMedium!
                          .copyWith(color: context.color.primaryColor)),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        context
                            .read<HomeCubit>()
                            .emitgetfilltergategoriescourse(
                                index == -1
                                    ? "all"
                                    : categories.first.name ?? '',
                                -1);
                        context.pushName(StringRoute.poluparScrean, arguments: {
                          'index': 0,
                          'cubit': context.read<HomeCubit>(),
                          'course': course
                        });
                      },
                      child: Row(
                        children: [
                          Text(context.translate(LangKeys.seeAll),
                              textAlign: TextAlign.right,
                              style: context.textStyle.titleLarge!.copyWith(
                                fontWeight: FontWeight.w800,
                                color: context.color.blue,
                              )),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: context.color.blue,
                          )
                        ],
                      ))
                ],
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxWidth: double.infinity, maxHeight: 55),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: CategoriesPopular(
                    categories: categories,
                  )),
            ),
          ],
        );
      },
    );
  }
}

class CategoriesPopular extends StatelessWidget {
  const CategoriesPopular({super.key, required this.categories});
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, int>(
        selector: (state) => state is FailtercourseLoadedState
            ? state.index
            : context.read<HomeCubit>().currentindexpupalr,
        builder: (context, currentindex) {
          return Row(children: [
            // All button at the start
            GestureDetector(
              onTap: () {
                context.read<HomeCubit>().emitgetfilltergategoriescourse(
                    'all', -1); // Using -1 to indicate "all" selection
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                padding: const EdgeInsets.all(6),
                decoration: ShapeDecoration(
                  color: currentindex == -1
                      ? const Color(0xFF167F71)
                      : context.color.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                constraints: const BoxConstraints(maxHeight: 55),
                child: Center(
                  child: Text(context.translate('all'),
                      textAlign: TextAlign.center,
                      style: context.textStyle.displaySmall!.copyWith(
                          color: currentindex == -1
                              ? context.color.white
                              : Colors.black,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ),
            // Original categories list
            ...List.generate(
              categories.length,
              (int i) => GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().emitgetfilltergategoriescourse(
                      categories[i].name ?? '', i);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  padding: const EdgeInsets.all(6),
                  decoration: ShapeDecoration(
                    color: currentindex == i
                        ? const Color(0xFF167F71)
                        : context.color.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  constraints: const BoxConstraints(maxHeight: 55),
                  child: Center(
                    child: Text(
                        context.translate(
                          categories[i].name ?? 'categories ',
                        ),
                        textAlign: TextAlign.center,
                        style: context.textStyle.displaySmall!.copyWith(
                            color: currentindex == i
                                ? context.color.white
                                : Colors.black,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
            )
          ]);
        });
  }
}
