import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';
import '../../../widget/app_text_form_field.dart';
import 'chat_bubble.dart';

class ScreenChatsDetalias extends StatelessWidget {
  const ScreenChatsDetalias({super.key});

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
            SvgPicture.asset(Assets.phoneBlack),
            horizontalSpace(20),
            SvgPicture.asset(Assets.imagesSearchGray),
            horizontalSpace(16)
          ],
          title: Text(context.translate(LangKeys.inbox),
              style: context.textStyle.bodyLarge),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: context.color.lightBlue,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.80, color: Color(0x7FB4BDC4)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Today',
                  style: context.textStyle.titleSmall!.copyWith(
                    color: context.color.primaryColor,
                    fontWeight: FontWeight.w800,
                  )),
            ),
            const SingleChildScrollView(
              child: Column(
                children: [
                  ChatBubble(
                    isCurrentUser: true,
                    message: ' hi ggggggggggggggi',
                  ),
                  ChatBubble(
                    isCurrentUser: false,
                    message: 'hello   ',
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 13),
              child: AppTextFormField(
                backgroundColor: context.color.lightBlue,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.color.lighterGray,
                    width: 1.3,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: context.translate(LangKeys.message),
                validator: (p0) {},
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: SvgPicture.asset(
                          Assets.addImage,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: CircleAvatar(
                        radius: 21,
                        backgroundColor: context.color.blue,
                        child: SvgPicture.asset(
                          Assets.microvon,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
