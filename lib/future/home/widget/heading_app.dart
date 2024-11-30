import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';

class HeadingApp extends StatelessWidget {
  const HeadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.translate(LangKeys.alex),
                  style: context.textStyle.labelLarge!
                      .copyWith(color: context.color.primaryColor)),
              verticalSpace(16),
              Text(context.translate(LangKeys.revio),
                  style: context.textStyle.displaySmall!.copyWith(
                      color: const Color(0xCC545454),
                      fontWeight: FontWeight.w700)),
            ],
          ),
          SvgPicture.asset(
            Assets.imagesNOTIFICATIONS,
          ),
        ],
      ),
    );
  }
}
