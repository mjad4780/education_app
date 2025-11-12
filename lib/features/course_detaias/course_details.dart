import 'dart:developer';

import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/failer_widget.dart';
import 'package:education/features/course_detaias/cubit/video_course_cubit.dart';

import 'package:education/features/course_detaias/widget/loading_video.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/language/lang_keys.dart';
import '../../widget/app_text_button.dart';
import '../home/data/model/response_home/course.dart';
import '../paymop/logic/paymop_cubit.dart';
import '../paymop/views/payment_view.dart';
import 'widget/course_details_card.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key, required this.course});
  final Course course;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VideoCourseCubit>()
        ..emitgetdataliascourse(course, course.id ?? 0),
      child: Scaffold(
          body: HomeBlocBuilder(
        course: course,
      )),
    );
  }
}

class HomeBlocBuilder extends StatelessWidget {
  const HomeBlocBuilder({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCourseCubit, VideoCourseState>(
      buildWhen: (previous, current) =>
          current is VideoCourseDatailasLoading ||
          current is FillterCourseSuccess ||
          current is VideoCourseDatailasFailer,
      builder: (context, state) {
        if (state is VideoCourseDatailasLoading) {
          return const CourseDetailsShimmer();
        } else if (state is VideoCourseDatailasFailer) {
          return FailerWidget(
            messege: state.message,
            onPressed: () => context
                .read<VideoCourseCubit>()
                .emitgetdataliascourse(course, course.id ?? 0),
          );
        } else if (state is FillterCourseSuccess) {
          return Stack(
            children: [
              CourseHeader(
                isfree: course.isFree ?? false,
                courseId: course.id ?? 0,
                videoId: state.fillterCourse.videos?.first.id ?? 0,
              ),
              CourseDetailsCard(
                detailasCourse: state.fillterCourse,
              ),
              Positioned(
                bottom: 10,
                left: 30,
                right: 30,
                child: !context.read<VideoCourseCubit>().headCourse!.isFree!
                    ? EnrollButton(
                        price: course.price ?? 0.0,
                        iD: state.fillterCourse.detailsId!,
                      )
                    : const SizedBox.shrink(),
              ),
              // const Positioned(bottom: 0, child: UpdateCourseListener())
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class CourseTitleRow extends StatelessWidget {
  const CourseTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(
        children: [
          Text(
            context.translate(
                context.read<VideoCourseCubit>().headCourse!.categoryName ??
                    ''),
            style: context.textStyle.titleSmall!.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFFFF6B00),
            ),
          ),
          // CircularProgressIndicator()
          const Spacer(),
          SvgPicture.asset(Assets.imagesStar),
          Text(
            '4.2',
            style: context.textStyle.displayLarge!.copyWith(
              color: context.color.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class EnrollButton extends StatelessWidget {
  const EnrollButton({super.key, required this.iD, required this.price});
  final int iD;
  final double price;
  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonHeight: 40.h,
      buttonText:
          '${context.translate(LangKeys.enroll)} \$${context.read<VideoCourseCubit>().headCourse!.price}',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentView(
              onPaymentSuccess: () {
                log('message');
                getIt<PaymopCubit>().updateCourseToFree(iD);
              },
              onPaymentError: () {
                log('failer');
              },
              price: price, // Required: Total price (e.g., 100 for 100 EGP)
            ),
          ),
        );
      },
      textStyle: context.textStyle.bodyMedium!,
    );
  }
}
