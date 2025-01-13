import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/video_course_cubit.dart';
import 'title_video_detailas.dart';

class CustomCurriculum extends StatelessWidget {
  const CustomCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemCount: context
                    .read<VideoCourseCubit>()
                    .fillterCourse!
                    .videos!
                    .length, // عدد الأقسام
                itemBuilder: (context, index) {
                  var cubit = context.read<VideoCourseCubit>();
                  return Column(
                    children: [
                      TitleVideoDetailas(
                        isfillexit: cubit.isfillgStatus(
                            cubit.fillterCourse!.videos![index].title!),
                        value: cubit.fillterCourse!.videos![index],
                        isDownloading: cubit.isFileDownloading(
                            cubit.fillterCourse!.videos![index].title!),
                        progress: cubit.progressdouble,
                      ),
                      const Divider()
                    ],
                  );

                  //  ExpansionTile(
                  //   title: Row(
                  //     children: [
                  //       FittedBox(
                  //           fit: BoxFit.scaleDown,
                  //           child: Text.rich(
                  //             TextSpan(
                  //               children: [
                  //                 TextSpan(
                  //                   text:
                  //                       '${context.read<VideoCourseCubit>().fillterCourse!.videos![index].title} - ',
                  //                   style:
                  //                       context.textStyle.titleMedium!.copyWith(
                  //                     color: const Color(0xFF202244),
                  //                     fontWeight: FontWeight.w600,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           )),
                  //       const Spacer(),
                  //       Text(
                  //         '${5} Mins',
                  //         style: context.textStyle.titleSmall!.copyWith(
                  //           color: const Color(0xFF0961F5),
                  //           fontWeight: FontWeight.w800,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   children: context
                  //       .read<VideoCourseCubit>()
                  //       .fillterCourse!
                  //       .videos!
                  //       .map((value) {
                  //     return TitleVideoDetailas(
                  //       isfillexit: context
                  //           .read<VideoCourseCubit>()
                  //           .isfillgStatus(value.title!),
                  //       value: value,
                  //       isDownloading: context
                  //           .read<VideoCourseCubit>()
                  //           .isFileDownloading(value.title!),
                  //       progress:
                  //           context.read<VideoCourseCubit>().progressdouble,
                  //     );
                  //   }).toList(),
                  // );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
