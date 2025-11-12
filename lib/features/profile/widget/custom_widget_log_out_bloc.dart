import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/features/profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/function/build_error_or_success_bar.dart';

class CustomWidgetLogOutBloc extends StatelessWidget {
  const CustomWidgetLogOutBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is LogoutFailure ||
          current is LogoutLoading ||
          current is LogoutSuccess,
      listener: (context, state) {
        if (state is LogoutLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
          // show loading dialog/spinner
        } else if (state is LogoutSuccess) {
          // Navigate to login screen
          context.pop();
          context.pushNamedAndRemoveUntil(StringRoute.login);
        } else if (state is LogoutFailure) {
          // Show error snackbar
          context.pop();
          buildErorr(context, state.message);
        }
      },
      child: const SizedBox.shrink(), // محتوى الشاشة
    );
  }
}
