import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/language/lang_keys.dart';
import 'package:education/future/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/Router/route_string.dart';
import '../../../core/helpers/app_regex.dart';
import '../../../core/helpers/spacing.dart';
import '../../../utility/images_aseets.dart';
import '../../../widget/app_text_button.dart';
import '../../../widget/app_text_form_field.dart';

class LoginScrean extends StatelessWidget {
  const LoginScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(130),
            Center(
              child: SvgPicture.asset(
                Assets.imagesLOGO,
                height: width(context) * 0.17,
              ),
            ),
            verticalSpace(50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      context.translate(LangKeys.letssignin),
                      style: context.textStyle.labelLarge!
                          .copyWith(color: context.color.primaryColor),
                    ),
                  ),
                  verticalSpace(2),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.translate(LangKeys.logintocontinue),
                        style: context.textStyle.titleLarge!
                            .copyWith(color: Colors.grey),
                      )),
                  verticalSpace(30),
                  const EmailAndPassword(),
                  verticalSpace(14),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(context.translate(LangKeys.forgotpassword),
                        style: context.textStyle.displaySmall!.copyWith(
                            color: const Color(0xFF545454), fontSize: 14)),
                  ),
                  verticalSpace(14),
                  AppTextButton(
                    buttonText: context.translate(LangKeys.signin),
                    onPressed: () {
                      context.read<LoginCubit>().emitLoginState();
                    },
                    textStyle: const TextStyle(),
                  ),
                  verticalSpace(20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(context.translate(LangKeys.orContinue),
                        style: context.textStyle.displaySmall!.copyWith(
                            color: const Color(0xFF545454), fontSize: 14)),
                  ),
                  verticalSpace(12),
                  Center(
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset(
                          Assets.imagesGoogle,
                          // height: width(context) * 0.17,
                        ),
                        horizontalSpace(33),
                        SvgPicture.asset(
                          Assets.imagesApple,
                          // height: width(context) * 0.17,
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                  verticalSpace(16),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: context.translate(LangKeys.noAccount),
                            style: context.textStyle.displaySmall!.copyWith(
                                color: const Color(0xFF545454), fontSize: 14)),
                        TextSpan(
                            text: context.translate(LangKeys.signUp),
                            style: context.textStyle.displaySmall!.copyWith(
                                fontSize: 14,
                                color: context.color.blue,
                                fontWeight: FontWeight.w800),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => context.pushName(StringRoute.signUp)),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

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
