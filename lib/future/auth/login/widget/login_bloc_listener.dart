import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Router/route_string.dart';
import '../../../../core/function/build_error_or_success_bar.dart';
import '../logic/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginFailure ||
          current is LoginLoading ||
          current is LoginSuccess,
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pop();
          buildSuccessBar(context, state.successString);
          context.pushNamedAndRemoveUntil(StringRoute.home);
        } else if (state is LoginFailure) {
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
