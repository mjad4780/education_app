import 'package:education/core/extensions/extention_navigator.dart';
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Categories',
                  style: context.textStyle.headlineMedium!
                      .copyWith(color: context.color.primaryColor)),
              const Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pushName(StringRoute.categories),
                    child: Text('SEE ALL',
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
            child: CarouselView(
                backgroundColor: context.color.greyLight,
                itemExtent: 150,
                shrinkExtent: 150,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                children: List.generate(
                  10,
                  (int i) => Text('3D Design ',
                      style: context.textStyle.headlineLarge!
                          .copyWith(color: context.color.blue)),
                ))),
      ],
    );
  }
}
