import 'dart:developer';

import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:education/core/language/lang_keys.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utility/list_categories_courses.dart';
import '../widget/widget polupar/custom_widget_course_polupar.dart';

class PoluparScrean extends StatefulWidget {
  const PoluparScrean({super.key, required this.index});
  final int index;
  @override
  State<PoluparScrean> createState() => _PoluparScreanState();
}

class _PoluparScreanState extends State<PoluparScrean> {
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
                child: CategoriseCoursePopular(
                  index: widget.index,
                )),
            const CustomWidgetPoluparCourse()
          ],
        ),
      )),
    );
  }
}

class CategoriseCoursePopular extends StatefulWidget {
  const CategoriseCoursePopular({
    super.key,
    required this.index,
  });
  final int index;
  @override
  State<CategoriseCoursePopular> createState() =>
      _CategoriseCoursePopularState();
}

int rebuild = 0;

class _CategoriseCoursePopularState extends State<CategoriseCoursePopular> {
  @override
  void initState() {
    super.initState();
    log(widget.index.toString());
    setState(() {
      rebuild = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            listCategoriesCouse(context).length,
            (i) => GestureDetector(
                  onTap: () {
                    setState(() {
                      rebuild = i;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      constraints:
                          const BoxConstraints(minHeight: 55, minWidth: 70),
                      alignment: Alignment.center, // جعل المحتوى في المنتصف
                      decoration: BoxDecoration(
                          color: rebuild == i
                              ? context.color.teal
                              : const Color(0xFFE8F1FF),
                          borderRadius: BorderRadius.circular(22)),
                      child: Text(listCategoriesCouse(context)[i],
                          textAlign: TextAlign.center,
                          style: context.textStyle.displaySmall!.copyWith(
                              color: rebuild == i
                                  ? const Color(0xFFE8F1FF)
                                  : context.color.black,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                )));
  }
}
