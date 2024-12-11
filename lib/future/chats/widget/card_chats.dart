import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

import '../../../core/Router/route_string.dart';
import '../../../core/helpers/spacing.dart';

class CardChats extends StatelessWidget {
  const CardChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) / 1.5,
      width: width(context) * 0.82,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: List.generate(
            20,
            (index) => GestureDetector(
              onTap: () => context.pushName(StringRoute.screenChatsDetalias),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black,
                        ),
                        horizontalSpace(3),
                        Column(
                          children: [
                            Text('Jiya Shetty',
                                style: context.textStyle.headlineSmall!
                                    .copyWith(
                                        color: context.color.primaryColor,
                                        fontWeight: FontWeight.w600)),
                            Text('3D Design',
                                style: context.textStyle.displaySmall!.copyWith(
                                    color: context.color.greyDark,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: context.color.blue,
                                shape: const OvalBorder(
                                  side: BorderSide(
                                      width: 2, color: Color(0xFFE8F1FF)),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '01',
                                  textAlign: TextAlign.center,
                                  style: context.textStyle.titleSmall!.copyWith(
                                    color: context.color.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Text('06:35',
                                textAlign: TextAlign.right,
                                style: context.textStyle.displayLarge!
                                    .copyWith(color: context.color.greyDark))
                          ],
                        )
                      ],
                    ),
                    const Divider(
                      color: Color(0xffE8F1FF),
                    )
                  ],
                ),
              ),
            ),
          ).toList()),
        ),
      ),
    );
  }
}
