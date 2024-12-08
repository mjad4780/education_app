import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:education/core/language/lang_keys.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/widget polupar/custom_widget_course_polupar.dart';

class PoluparScrean extends StatelessWidget {
  const PoluparScrean({super.key});

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
            size: 35,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          SvgPicture.asset(Assets.imagesSearchGray),
          horizontalSpace(13)
        ],
        title: Text(context.translate(LangKeys.popularCourses),
            style: context.textStyle.bodyLarge),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                    (i) => Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        constraints:
                            const BoxConstraints(minHeight: 55, minWidth: 70),
                        alignment: Alignment.center, // جعل المحتوى في المنتصف
                        decoration: BoxDecoration(
                            color: const Color(0xFFE8F1FF),
                            borderRadius: BorderRadius.circular(22)),
                        child: Text('Personal devoleber ',
                            textAlign: TextAlign.center,
                            style: context.textStyle.displaySmall!.copyWith(
                                color: context.color.black,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                )),
            const CustomWidgetPoluparCourse()
          ],
        ),
      )),
    );
  }
}
