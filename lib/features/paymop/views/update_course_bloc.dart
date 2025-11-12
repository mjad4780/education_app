import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/paymop_cubit.dart';

class UpdateCourseListener extends StatelessWidget {
  const UpdateCourseListener({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymopCubit, PaymopState>(
      listenWhen: (previous, current) =>
          current is UpdateCourseLoading ||
          current is UpdateCourseFailer ||
          current is UpdateCourseSuccess,
      listener: (context, state) {
        if (state is UpdateCourseSuccess) {
          // buildSuccessBar(context, state.successString);
          context.pushNamedAndRemoveUntil(StringRoute.main);
        } else if (state is UpdateCourseFailer) {
        } else {}
      },
      child: const SizedBox.shrink(),
    );
  }
}
