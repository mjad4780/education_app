import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/features/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35.sp,
          ),
          onPressed: () {
            context.read<MainCubit>().changeIndex(0);
          },
        ),
        Text(context.translate(LangKeys.transaction),
            style: context.textStyle.bodyLarge),
        const Spacer(),
        SvgPicture.asset(Assets.imagesSearchGray),
        horizontalSpace(13)
      ],
    );
  }
}
