import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/function/build_error_or_success_bar.dart';
import 'package:education/future/course%20detaias/cubit/video_course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCourseListener extends StatelessWidget {
  const UpdateCourseListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VideoCourseCubit, VideoCourseState>(
      listenWhen: (previous, current) =>
          current is UpdateCourseLoading ||
          current is UpdateCourseFailer ||
          current is UpdateCourseSuccess,
      listener: (context, state) {
        if (state is UpdateCourseSuccess) {
          context.pop();
          // buildSuccessBar(context, state.successString);
          buildSuccess(context, state.messageSuccess,
              () => context.pushNamedAndRemoveUntil(StringRoute.main));
        } else if (state is UpdateCourseFailer) {
          context.pop();
          buildErorr(context, state.message);
        } else {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
