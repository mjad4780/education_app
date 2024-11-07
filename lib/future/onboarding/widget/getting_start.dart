import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/style/text_string.dart';

class GettingStart extends StatelessWidget {
  const GettingStart(
      {super.key, required this.currentindex, required this.callback});
  final int currentindex;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (currentindex == 2)
          InkWell(
            onTap: () => callback(),
            child: Container(
              decoration: BoxDecoration(
                  color: context.color.mainBlue,
                  borderRadius: BorderRadius.circular(55)),
              child: Row(
                children: [
                  horizontalSpace(9),
                  Text(
                    context.translate(AppTextKeys.gettingStarted),
                    style: context.textStyle.headlineMedium!
                        .copyWith(color: context.color.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: context.color.moreLightGray,
                          borderRadius: BorderRadius.circular(55)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: context.color.mainBlue,
                        size: 24.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (currentindex != 2)
          Container(
            decoration: BoxDecoration(
                color: context.color.mainBlue,
                borderRadius: BorderRadius.circular(55)),
            child: IconButton(
                onPressed: callback,
                icon: Icon(
                  Icons.arrow_forward,
                  color: context.color.white,
                  size: 35,
                )),
          )
      ],
    );
  }
}
