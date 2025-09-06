import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';
import 'categories_profile.dart';
import 'custom_widget_log_out_bloc.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: const Color(0xffFFFFFF),
      child: Container(
        width: width(context) * 0.82,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: [
            verticalSpace(70),
            Text(
              user?.userMetadata?['name'] ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF202244),
                fontSize: 24,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            Text(
              user?.email ?? 'email',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF545454),
                fontSize: 13,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            verticalSpace(20),
            CategoriesProfile(
              image: Assets.iconProfile,
              title: LangKeys.editProfile,
              onTap: () => context.pushName(StringRoute.screenEditProfile,
                  arguments: {
                    'cubit': context.read<ProfileCubit>(),
                    'user': user
                  }),
            ),
            const CategoriesProfile(
              image: Assets.trans,
              title: LangKeys.transaction,
            ),
            const CategoriesProfile(
              image: Assets.notificationblack,
              title: LangKeys.notifications,
            ),
            const CategoriesProfile(
              image: Assets.security,
              title: LangKeys.security,
            ),
            CategoriesProfile(
              image: Assets.language,
              title: LangKeys.language,
              onTap: () => context.pushName(StringRoute.screenLanguage),
            ),
            const CategoriesProfile(
              image: Assets.dark,
              title: LangKeys.darkMode,
            ),
            const CategoriesProfile(
              image: Assets.terms,
              title: LangKeys.termsConditions,
            ),
            const CategoriesProfile(
              image: Assets.help,
              title: LangKeys.helpCenter,
            ),
            const CategoriesProfile(
              image: Assets.infite,
              title: LangKeys.inviteFriends,
            ),
            GestureDetector(
              onTap: () => context.read<ProfileCubit>().logout(),
              child: Row(
                children: [
                  horizontalSpace(16),
                  Icon(Icons.logout, color: Colors.red.shade400, size: 25),
                  horizontalSpace(20),
                  Text('Log Out', style: context.textStyle.titleMedium!),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const CustomWidgetLogOutBloc()
          ],
        ),
      ),
    );
  }
}
