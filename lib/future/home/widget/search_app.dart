import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';
import '../../../widget/app_text_form_field.dart';

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 13),
      child: AppTextFormField(
        prfixIcon: SvgPicture.asset(
          Assets.serach,
          // width: 2,
          // height: 2,
        ),
        hintText: context.translate(LangKeys.search),
        validator: (p0) {},
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: SvgPicture.asset(
            Assets.imagesFILTER,
            height: 50,
          ),
        ),
      ),
    );
  }
}
