import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/app_regex.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../widget/app_text_button.dart';
import '../../../widget/app_text_form_field.dart';
import '../logic/cubit/profile_cubit.dart';
import '../widget/edit_profile/custom_phone_and_gender.dart';
import '../widget/edit_profile/image_profile_sign_up.dart';

class ScreenEditProfile extends StatelessWidget {
  const ScreenEditProfile({super.key});

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
        title: Text(context.translate(LangKeys.editProfile),
            style: context.textStyle.bodyLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: context.read<ProfileCubit>().formkeySignUp,
            autovalidateMode:
                context.read<ProfileCubit>().autovalidateModeSignUp,
            child: Column(
              children: [
                // Profile Picture
                const ImageEditProfileBloc(),
                ////////////////////////////////
                const SizedBox(height: 24),
                // Full Name Field
                AppTextFormField(
                  controller: context.read<ProfileCubit>().name,
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
                  controller: context.read<ProfileCubit>().lastname,
                  hintText: context.translate(LangKeys.last),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid last name';
                    }
                  },
                ),

                verticalSpace(15),
                AppTextFormField(
                  controller: context.read<ProfileCubit>().email,
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
                BlocSelector<ProfileCubit, ProfileState, bool>(
                  selector: (ProfileState state) =>
                      state is IsObscureText ? state.isObscureText : true,
                  builder: (context, isObscureText) {
                    return AppTextFormField(
                      controller: context.read<ProfileCubit>().password,
                      isObscureText: isObscureText,
                      suffixIcon: GestureDetector(
                        onTap: () => context
                            .read<ProfileCubit>()
                            .isObscureTextPassword(),
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

                verticalSpace(15),

                const CustomPhoneAndGenderInEditProfile(),

                const SizedBox(height: 32),

                AppTextButton(
                  buttonText: context.translate(LangKeys.update),
                  onPressed: () {
                    // context.read<ProfileCubit>().emitsignUp(context),
                  },
                  textStyle: const TextStyle(),
                ),
                // const SignUpBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
