import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/utility/list_categories_courses.dart';
import 'package:flutter/material.dart';

import '../../../core/Router/route_string.dart';
import '../../../core/language/lang_keys.dart';

class CustomPoluparCourse extends StatelessWidget {
  const CustomPoluparCourse({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onTap: () => context.pushName(StringRoute.poluparScrean),
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
          constraints:
              const BoxConstraints(maxWidth: double.infinity, maxHeight: 55),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              listCategoriesCouse(context).length,
              (int i) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                padding: const EdgeInsets.all(6),
                decoration: ShapeDecoration(
                  color: const Color(0xFF167F71),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                constraints: const BoxConstraints(maxHeight: 55),
                child: Center(
                  child: Text(listCategoriesCouse(context)[i],
                      textAlign: TextAlign.center,
                      style: context.textStyle.displaySmall!.copyWith(
                          color: context.color.white,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            )),
          ),
        ),
      ],
    );
  }
}
