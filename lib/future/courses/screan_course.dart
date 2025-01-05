import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:education/future/courses/cubit/my_course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/language/lang_keys.dart';
import '../../utility/images_aseets.dart';
import '../../widget/app_text_form_field.dart';
import 'widget/custom_buttom_my_course.dart';
import 'widget/custom_completed_course.dart';
import 'widget/custom_ongoing_course.dart';

class ScreanCourses extends StatelessWidget {
  const ScreanCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => getIt<MyCourseCubit>(),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () {},
              ),
              Text(context.translate(LangKeys.myCourses),
                  style: context.textStyle.bodyLarge),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 13),
            child: AppTextFormField(
              hintText: context.translate(LangKeys.search),
              validator: (p0) {},
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: SvgPicture.asset(
                  Assets.imagesSearchBlue,
                  height: 50,
                ),
              ),
            ),
          ),
          const CustombuttomMyCourse(),
          verticalSpace(5),
          BlocSelector<MyCourseCubit, MyCourseState, bool>(
            selector: (state) => state is WatchRebuild ? state.rebuild : true,
            builder: (context, isrebuild) {
              return isrebuild
                  ? const CustomCompletedCourse()
                  : const CustomOngoingCourse();
            },
          )
        ],
      ),
    ));
  }
}
