import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

import '../../../core/Router/route_string.dart';

class CustomPoluparCourse extends StatelessWidget {
  const CustomPoluparCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Polupar Courses',
                  style: context.textStyle.headlineMedium!
                      .copyWith(color: context.color.primaryColor)),
              const Spacer(),
              GestureDetector(
                  onTap: () => context.pushName(StringRoute.poluparScrean),
                  child: Row(
                    children: [
                      Text(
                        'SEE ALL',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: context.color.blue,
                          fontSize: 14,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
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
          child: CarouselView(
              backgroundColor: const Color(0xFF167F71),
              itemSnapping: true,
              itemExtent: 150,
              shrinkExtent: 150,
              children: List.generate(
                10,
                (int i) => Center(
                  child: Text('Personal developer',
                      textAlign: TextAlign.center,
                      style: context.textStyle.displaySmall!.copyWith(
                          color: context.color.white,
                          fontWeight: FontWeight.w700)),
                ),
              )),
        ),
      ],
    );
  }
}
