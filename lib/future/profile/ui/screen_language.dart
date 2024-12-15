import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import '../../../core/language/lang_keys.dart';
import '../widget/select_language.dart';

class ScreenLanguage extends StatelessWidget {
  const ScreenLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () => context.pop()),
        title: Text(context.translate(LangKeys.language),
            style: context.textStyle.bodyLarge),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 25),
            child: Text(context.translate(LangKeys.subcategories),
                style: context.textStyle.headlineMedium),
          ),
          verticalSpace(10),
          const SelectLanguage(
            title: 'english',
          ),
          verticalSpace(18),
          const SelectLanguage(
            title: 'arabic',
          )
        ],
      ),
    );
  }
}
