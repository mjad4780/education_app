// generate stateleeswidget update profile bloc listier
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/function/build_error_or_success_bar.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is UpdateUserLoading ||
          current is UpdateUserFailure ||
          current is UpdateUserSuccess,
      listener: (context, state) {
        if (state is UpdateUserLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        } else if (state is UpdateUserSuccess) {
          context.pop();
          context.pop();

          context.read<ProfileCubit>().getUser();
          // context.pop();
          // buildSuccessBar(context, state.successString);
        } else if (state is UpdateUserFailure) {
          context.pop();
          buildErorr(context, state.message);
        } else {}
      },
      child: const SizedBox.shrink(),
    );
  }
}
