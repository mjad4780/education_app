import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/auth/sign%20up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/app_regex.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../widget/app_text_button.dart';
import '../../../widget/app_text_form_field.dart';

import 'widget/custom_phone_and_gender.dart';
import 'widget/image_profile_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text("Fill Your Profile", style: context.textStyle.bodyLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: context.read<SignUpCubit>().formkeySignUp,
            autovalidateMode:
                context.read<SignUpCubit>().autovalidateModeSignUp,
            child: Column(
              children: [
                // Profile Picture
                const ImageProfileBloc(),
                ////////////////////////////////
                const SizedBox(height: 24),
                // Full Name Field
                AppTextFormField(
                  controller: context.read<SignUpCubit>().name,
                  hintText: context.translate(LangKeys.fullName),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid name';
                    }
                  },
                ),
                verticalSpace(15),
                // Nick Name Field
                AppTextFormField(
                  controller: context.read<SignUpCubit>().lastname,
                  hintText: context.translate(LangKeys.last),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid last name';
                    }
                  },
                ),

                verticalSpace(15),
                AppTextFormField(
                  controller: context.read<SignUpCubit>().email,
                  hintText: context.translate(LangKeys.email),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return 'Please enter a valid email';
                    }
                  },
                ),
                verticalSpace(15),
                BlocSelector<SignUpCubit, SignUpState, bool>(
                  selector: (SignUpState state) =>
                      state is IsObscureText ? state.isObscureText : true,
                  builder: (context, isObscureText) {
                    return AppTextFormField(
                      controller: context.read<SignUpCubit>().password,
                      isObscureText: isObscureText,
                      suffixIcon: GestureDetector(
                        onTap: () =>
                            context.read<SignUpCubit>().isObscureTextPassword(),
                        child: Icon(
                          isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
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

                // Phone Number Field
                verticalSpace(15),

                const CustomPhoneAndGender(),

                const SizedBox(height: 32),
                // Continue Button

                AppTextButton(
                  buttonText: context.translate(LangKeys.continu),
                  onPressed: () {
                    context.read<SignUpCubit>().emitSignUpState(context);
                  },
                  textStyle: const TextStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
