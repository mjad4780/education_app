import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/future/main/cubit/main_cubit.dart';
import 'package:education/future/profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../widget/card_profile.dart';
import '../widget/get_profile_bloc.dart';

class ScreanProfile extends StatelessWidget {
  const ScreanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUser(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 35,
                    ),
                    onPressed: () {
                      context.read<MainCubit>().changeIndex(0);
                    },
                  ),
                  Text(context.translate(LangKeys.profile),
                      style: context.textStyle.bodyLarge),
                ],
              ),
            ),
            const GetProfileBlocBuilder(),
          ],
        ),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              CardProfile(
                user: user,
              ),
            ],
          ),
        ),
        if (user?.userMetadata?['image'] != null ||
            user?.userMetadata?['avatar_url'] != null)
          Positioned(
              top: 20,
              right: width(context) / 3.4,
              child: Container(
                decoration: const ShapeDecoration(
                  color: Color(0xFFD7D7D7),
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 4,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Color(0xFF167F71),
                    ),
                  ),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: CachedNetworkImageProvider(
                      user?.userMetadata?['image'] ??
                          user?.userMetadata?['avatar_url'] ??
                          ""),
                ),
              )),
      ],
    );
  }
}
