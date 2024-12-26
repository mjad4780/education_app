import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/const.dart';
import '../cubit/video_course_cubit.dart';
import '../data/models/response_video/response_video.dart';
import 'title_video_detailas.dart';

class CustomCurriculum extends StatelessWidget {
  const CustomCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
    ResponseVideo courseModel = ResponseVideo.fromJson(ahmeder);
    return Column(
      children: [
        SizedBox(
          height: height(context) / 3.3,
          child: BlocConsumer<VideoCourseCubit, VideoCourseState>(
            listener: (context, state) {
              if (state is PlayFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('خطأ أثناء تحميل الملف: ${state.message}')),
                );
              }
            },
            builder: (context, state) {
              return ListView.builder(
                itemCount: courseModel.lectures!.length, // عدد الأقسام
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Row(
                      children: [
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${courseModel.lectures![index].lectureTitle} - ',
                                    style:
                                        context.textStyle.titleMedium!.copyWith(
                                      color: const Color(0xFF202244),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const Spacer(),
                        Text(
                          '${5} Mins',
                          style: context.textStyle.titleSmall!.copyWith(
                            color: const Color(0xFF0961F5),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    children:
                        courseModel.lectures![index].resources!.map((value) {
                      return TitleVideoDetailas(
                        isfillexit: context
                            .read<VideoCourseCubit>()
                            .isfillgStatus(value.name),
                        value: value,
                        isDownloading: context
                            .read<VideoCourseCubit>()
                            .isFileDownloading(value.name),
                        progress:
                            context.read<VideoCourseCubit>().progressdouble,
                      );
                    }).toList(),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
