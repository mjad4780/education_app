import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/helpers/spacing.dart';
import '../../core/language/lang_keys.dart';
import 'widget/card_profile.dart';

class ScreanProfile extends StatelessWidget {
  const ScreanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  onPressed: () {},
                ),
                Text(context.translate(LangKeys.editProfile),
                    style: context.textStyle.bodyLarge),
              ],
            ),
          ),
          Stack(
            children: [
              const Positioned(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    CardProfile(),
                  ],
                ),
              ),
              Positioned(
                  top: 20,
                  right: width(context) / 3.4,
                  child: Container(
                    width: 110,
                    height: 110,
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
                  )),
              Positioned(
                top: 90,
                right: width(context) / 3.2,
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    // backgroundColor: context.color.teal,
                    radius: 17,
                    child: SvgPicture.asset(
                      Assets.photos,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
