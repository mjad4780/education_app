import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';
import 'categories_profile.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({super.key});

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
            const Text(
              'Alex',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF202244),
                fontSize: 24,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const Text(
              'hernandex.redial@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF545454),
                fontSize: 13,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            verticalSpace(50),
            const CategoriesProfile(
              image: Assets.iconProfile,
              title: LangKeys.editProfile,
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
            const CategoriesProfile(
              image: Assets.language,
              title: LangKeys.language,
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
          ],
        ),
      ),
    );
  }
}
