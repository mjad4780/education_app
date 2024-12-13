import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesProfile extends StatelessWidget {
  const CategoriesProfile(
      {super.key, required this.image, required this.title, this.onTap});
  final String image, title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Spacer(
            flex: title == 'language' ? 2 : 1,
          ),
          SvgPicture.asset(image),
          const Spacer(),
          Text(context.translate(title), style: context.textStyle.titleMedium!),
          const Spacer(
            flex: 9,
          ),
          Visibility(
            visible: title == 'language' ? true : false,
            child: Text('English (US)',
                textAlign: TextAlign.right,
                style: context.textStyle.titleLarge!.copyWith(
                  color: context.color.blue,
                  fontWeight: FontWeight.w800,
                )),
          ),
          Visibility(
            visible: rr(title), // title == 'notifications' ? true : false,
            child: Switch(
                activeColor: context.color.blue,
                activeTrackColor: const Color(0xFFE8F1FF),
                splashRadius: 22,
                hoverColor: const Color(0xFFE8F1FF),
                inactiveTrackColor: const Color(0xFFE8F1FF),
                value: true,
                focusNode: FocusNode(),
                onChanged: (value) {}),
          ),
          Visibility(
            visible: rr2(title),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  rr(String title) {
    if (title == 'notifications') {
      return true;
    } else if (title == 'dark_mode') {
      return true;
    } else {
      return false;
    }
  }

  rr2(String title) {
    if (title == 'notifications') {
      return false;
    } else if (title == 'dark_mode') {
      return false;
    } else {
      return true;
    }
  }
}
