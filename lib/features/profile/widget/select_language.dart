import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utility/images_aseets.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({
    super.key,
    this.onTap,
    required this.title,
  });
  final Function()? onTap;
  final String title;

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  bool ischeckeing = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(context.translate(widget.title),
            style: context.textStyle.headlineLarge),
        const Spacer(
          flex: 7,
        ),
        GestureDetector(
          onTap: () {
            ischeckeing = !ischeckeing;
          },
          child: Container(
            width: 28,
            height: 28,
            decoration: ShapeDecoration(
              color: ischeckeing ? context.color.teal : context.color.lightBlue,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 2,
                    color: ischeckeing
                        ? context.color.teal
                        : context.color.greyish),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: ischeckeing
                  ? SvgPicture.asset(
                      Assets.trueCon,
                    )
                  : null,
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
