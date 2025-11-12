import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../widget/app_text_form_field.dart';
import '../logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: context.read<LoginCubit>().autovalidateMode,
      key: context.read<LoginCubit>().formkey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().email,
            hintText: context.translate(LangKeys.email),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(22),
          BlocSelector<LoginCubit, LoginState, bool>(
            selector: (LoginState state) =>
                state is IsObscureText ? state.isObscureText : true,
            builder: (context, isObscureText) {
              return AppTextFormField(
                controller: context.read<LoginCubit>().password,
                isObscureText: isObscureText,
                suffixIcon: GestureDetector(
                  onTap: () =>
                      context.read<LoginCubit>().isObscureTextPassword(),
                  child: Icon(
                    isObscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                hintText: context.translate(LangKeys.password),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
