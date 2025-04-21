import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/function/build_error_or_success_bar.dart';
import '../logic/cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignupFailure ||
          current is SignupLoading ||
          current is SignupSuccess,
      listener: (context, state) {
        if (state is SignupSuccess) {
          context.pop();
          // context.pop();
          // buildSuccessBar(context, state.successString);
        } else if (state is SignupFailure) {
          context.pop();
          buildErrorBar(context, state.message);
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
