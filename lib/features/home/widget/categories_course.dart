import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/language/lang_keys.dart';
import 'package:education/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Router/route_string.dart';
import '../data/model/response_home/category.dart';

class CustomCategoriesCourse extends StatelessWidget {
  const CustomCategoriesCourse({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(context.translate(LangKeys.categories),
                  style: context.textStyle.headlineMedium!
                      .copyWith(color: context.color.primaryColor)),
              const Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pushName(StringRoute.categories,
                        arguments: {
                          'cubit': context.read<HomeCubit>(),
                          'categories': categories
                        }),
                    child: Text(context.translate(LangKeys.seeAll),
                        textAlign: TextAlign.right,
                        style: context.textStyle.titleLarge!.copyWith(
                            color: context.color.blue,
                            fontWeight: FontWeight.w800)),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: context.color.blue,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
            width: double.infinity,
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () => context.pushName(StringRoute.categories,
                    arguments: {
                      'cubit': context.read<HomeCubit>(),
                      'categories': categories
                    }),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(context.translate(categories[i].name ?? ''),
                      style: context.textStyle.headlineLarge!
                          .copyWith(color: context.color.blue)),
                ),
              ),
            ))
      ],
    );
  }
}
