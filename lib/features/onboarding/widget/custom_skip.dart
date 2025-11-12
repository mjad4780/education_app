import 'package:education/app/education_cubit/education_cubit.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Router/route_string.dart';
import '../../../core/get_it/get_it.dart';
import '../../../core/helpers/cache_helper.dart';
import '../../../core/style/text_string.dart';
import '../../../utility/constant.dart';

class CustomSkipAndTheme extends StatelessWidget {
  const CustomSkipAndTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                context.read<EducationCubit>().changeAppThemeMode();
              },
              icon: Icon(
                Icons.dark_mode_outlined,
                color: context.color.black,
                size: 30,
              )),
          GestureDetector(
              onTap: () {
                context.pushName(StringRoute.login);
                getIt<CacheHelper>()
                    .saveData(key: Keys.onboarding, value: true);
              },
              child: Text(
                context.translate(AppTextKeys.skip),
                style: context.textStyle.headlineMedium,
              ))
        ],
      ),
    );
  }
}
