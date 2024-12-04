import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import '../../../core/language/lang_keys.dart';

class CustomMentor extends StatelessWidget {
  const CustomMentor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.translate(LangKeys.topMentors),
                  style: context.textStyle.headlineMedium!
                      .copyWith(color: context.color.primaryColor)),
              const Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pushName(StringRoute.mentorScreen),
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
            height: height(context) * 0.19,
            child: CarouselView(
                itemSnapping: true,
                backgroundColor: context.color.greyLight,
                itemExtent: 120,
                shrinkExtent: 120,
                onTap: (value) => context.pushName(StringRoute.mentorDetalias),
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
                  (int i) => Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          // width: 80,
                          // height: 70,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Text('mohamed',
                            style: context.textStyle.headlineLarge!
                                .copyWith(color: context.color.primaryColor)),
                      ),
                    ],
                  ),
                ))),
      ],
    );
  }
}
