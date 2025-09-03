import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/language/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/Router/route_string.dart';
import '../../../core/helpers/spacing.dart';
import '../../../utility/images_aseets.dart';
import '../data/model/response_home/mentor.dart';

class MentorScreen extends StatelessWidget {
  const MentorScreen({super.key, this.mentors});
  final List<Mentor>? mentors;

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
              size: 30,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          actions: [
            SvgPicture.asset(Assets.imagesSearchGray),
            horizontalSpace(13)
          ],
          title: Text(context.translate(LangKeys.topMentors),
              style: context.textStyle.bodyLarge),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: List.generate(
              mentors?.length ?? 0,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => context.pushName(StringRoute.mentorDetalias,
                      arguments: mentors?[index]),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                      ),
                      horizontalSpace(3),
                      Column(
                        children: [
                          Text(mentors?[index].name ?? '',
                              style: context.textStyle.labelSmall!.copyWith(
                                  color: context.color.primaryColor,
                                  fontWeight: FontWeight.w600)),
                          Text(
                              context.translate(
                                mentors?[index].title ?? '',
                              ),
                              style: context.textStyle.displaySmall!.copyWith(
                                  color: context.color.greyDark,
                                  fontWeight: FontWeight.w700)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ).toList()),
          ),
        ));
  }
}
