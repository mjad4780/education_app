import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/profile/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/helpers/app_regex.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../widget/app_text_button.dart';
import '../../../widget/app_text_form_field.dart';
import '../logic/cubit/profile_cubit.dart';
import '../widget/edit_profile/custom_phone_and_gender.dart';
import '../widget/edit_profile/image_profile_sign_up.dart';
import '../widget/edit_profile/update_profile_bloc.dart';

class ScreenEditProfile extends StatefulWidget {
  const ScreenEditProfile({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<ScreenEditProfile> createState() => _ScreenEditProfileState();
}

late TextEditingController email;
late TextEditingController name;
late TextEditingController lastname;
late TextEditingController phone;
String? gender;
(String?, String?)? image;

class _ScreenEditProfileState extends State<ScreenEditProfile> {
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    name = TextEditingController();
    lastname = TextEditingController();
    phone = TextEditingController();

    email.text = (widget.data['user'] as User).email ?? '';
    lastname.text =
        (widget.data['user'] as User).userMetadata?['lastname'] ?? '';
    name.text = (widget.data['user'] as User).userMetadata?['name'] ?? '';
    phone.text = (widget.data['user'] as User).userMetadata?['phone'] ?? '';
    gender = (widget.data['user'] as User).userMetadata?['gender'];
    image = (
      (widget.data['user'] as User).userMetadata?['image'],
      (widget.data['user'] as User).userMetadata?['avatar_url']
    );
    // (widget.data['user'] as User).userMetadata?['image'] ??
    //     (widget.data['user'] as User).userMetadata?['avatar_url'];
  }

  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    name.dispose();
    lastname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.data['cubit'] as ProfileCubit,
      child: Builder(builder: (context) {
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
                    ImageEditProfileBloc(
                      urlImage: image?.$1 ?? image?.$2,
                    ),
                    ////////////////////////////////
                    const SizedBox(height: 24),
                    // Full Name Field
                    AppTextFormField(
                      controller: name,
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
                      controller: lastname,
                      hintText: context.translate(LangKeys.last),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid last name';
                        }
                      },
                    ),

                    verticalSpace(15),
                    AppTextFormField(
                      controller: email,
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

                    verticalSpace(15),

                    CustomPhoneAndGenderInEditProfile(
                      phone: phone,
                      gender: gender,
                    ),

                    const SizedBox(height: 32),

                    AppTextButton(
                      buttonText: context.translate(LangKeys.update),
                      onPressed: () {
                        context.read<ProfileCubit>().updateUserAndImageProfile(
                            ProfileModel(
                                imagePath: image?.$1,
                                email: email.text,
                                imageFile: context.read<ProfileCubit>().file,
                                data: DateProfile(
                                    gender: context.read<ProfileCubit>().gender,
                                    lastname: lastname.text,
                                    name: name.text,
                                    image: image?.$1,
                                    phone: phone.text)));
                      },
                      textStyle: const TextStyle(),
                    ),
                    const UpdateProfileBlocListener()
                    // const SignUpBlocListener()
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
