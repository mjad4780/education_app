import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/language/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/Router/route_string.dart';
import '../../../core/helpers/spacing.dart';
import '../../../utility/images_aseets.dart';
import '../../../widget/custom_cache_networking_image.dart';
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
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (mentors?[index].profileImage != null)
                        Container(
                            width: 80,
                            height: 70,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // image: DecorationImage(
                              //     image: AssetImage(
                              //         mentors[i].profileImage ?? ''))
                            ),
                            child: CustomCachedNetworkImage(
                              imageUrl: mentors![index].profileImage!,
                            )),
                      horizontalSpace(3),
                      horizontalSpace(3),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mentors?[index].name ?? '',
                                style: context.textStyle.labelSmall!.copyWith(
                                    color: context.color.primaryColor,
                                    fontWeight: FontWeight.w600)),
                            Text(mentors?[index].bio ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: context.textStyle.displaySmall!.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    color: context.color.greyDark,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
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
