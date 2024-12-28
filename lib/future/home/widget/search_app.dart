import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 13),
      child: GestureDetector(
        onTap: () => context.pushName(StringRoute.searchScreen),
        child: Container(
          width: 360,
          height: 64,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 12,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.serach,
                  width: 30,
                  height: 30,
                ),
                horizontalSpace(3),
                Text(context.translate(LangKeys.search)),
                const Spacer(),
                SvgPicture.asset(
                  Assets.imagesFILTER,
                  height: 45,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
