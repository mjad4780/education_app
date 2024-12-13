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
