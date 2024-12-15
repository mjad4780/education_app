import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/language/lang_keys.dart';
import 'package:education/utility/list_categories_courses.dart';
import 'package:flutter/material.dart';

import '../../../core/Router/route_string.dart';

class CustomCategoriesCourse extends StatelessWidget {
  const CustomCategoriesCourse({super.key});

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
                    onTap: () => context.pushName(StringRoute.categories),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                listCategoriesCouse(context).length,
                (int i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(listCategoriesCouse(context)[i],
                      style: context.textStyle.headlineLarge!
                          .copyWith(color: context.color.blue)),
                ),
              )),
            )),
      ],
    );
  }
}
