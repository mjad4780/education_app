import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/helpers/spacing.dart';
import '../../core/language/lang_keys.dart';
import 'widget/card_chats.dart';
import 'widget/custom_buttom_chats.dart';

class ScreanChats extends StatelessWidget {
  const ScreanChats({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 35.sp,
                ),
                onPressed: () {},
              ),
              Text(context.translate(LangKeys.inbox),
                  style: context.textStyle.bodyLarge),
              const Spacer(),
              SvgPicture.asset(Assets.imagesSearchGray),
              horizontalSpace(13)
            ],
          ),
          verticalSpace(13),
          const CustomButtomChats(),
          verticalSpace(13),
          const CardChats()
          // const CustomWidgetCalls()
        ],
      ),
    );
  }
}
