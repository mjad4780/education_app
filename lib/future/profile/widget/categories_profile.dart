import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesProfile extends StatefulWidget {
  const CategoriesProfile({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image, title;
  final Function()? onTap;

  @override
  State<CategoriesProfile> createState() => _CategoriesProfileState();
}

class _CategoriesProfileState extends State<CategoriesProfile> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Spacer(flex: widget.title == 'language' ? 2 : 1),
          SvgPicture.asset(widget.image),
          const Spacer(),
          Text(
            context.translate(widget.title),
            style: context.textStyle.titleMedium!,
          ),
          const Spacer(flex: 9),

          // اللغة
          if (widget.title == 'language')
            Text(
              'English (US)',
              textAlign: TextAlign.right,
              style: context.textStyle.titleLarge!.copyWith(
                color: context.color.blue,
                fontWeight: FontWeight.w800,
              ),
            ),

          // السويتش
          if (widget.title == 'notifications' || widget.title == 'dark_mode')
            Switch(
              activeColor: context.color.blue,
              activeTrackColor: const Color(0xFFE8F1FF),
              splashRadius: 22,
              hoverColor: const Color(0xFFE8F1FF),
              inactiveTrackColor: const Color(0xFFE8F1FF),
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),

          // السهم
          if (widget.title != 'notifications' && widget.title != 'dark_mode')
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
    );
  }
}
