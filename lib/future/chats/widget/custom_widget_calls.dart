import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../utility/images_aseets.dart';
import 'screen_call_video.dart';

class CustomWidgetCalls extends StatelessWidget {
  const CustomWidgetCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) / 1.5,
      width: width(context) * 0.82,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
              children: List.generate(
            20,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VideoCallPage(
                        userName: "mohamed",
                        callId: "123345678",
                      ),
                    ),
                  );
                },
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text('Jiya Shetty',
                                  style: context.textStyle.headlineSmall!
                                      .copyWith(
                                          color: context.color.primaryColor,
                                          fontWeight: FontWeight.w600)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(Assets.xx),
                                horizontalSpace(3),
                                SizedBox(
                                  child: Text('Incoming   |   Nov 03, 202X',
                                      style: context.textStyle.displaySmall!
                                          .copyWith(
                                              color: context.color.greyDark,
                                              fontWeight: FontWeight.w700)),
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(Assets.iconarrive),
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
