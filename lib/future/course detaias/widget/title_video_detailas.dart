import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/video_course_cubit.dart';

import 'dart:io';
import '../data/models/detailashome/video.dart';

class CustomCurriculum extends StatelessWidget {
  const CustomCurriculum(
      {super.key, required this.videos, required this.courseId});
  final List<Video> videos;
  final int courseId;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) / 2.36,
      child: BlocConsumer<VideoCourseCubit, VideoCourseState>(
        listenWhen: (previous, current) => current is PlayFailure,
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
            itemCount: videos.length,
            itemBuilder: (context, index) {
              var cubit = context.read<VideoCourseCubit>();
              return Column(
                mainAxisSize:
                    MainAxisSize.min, // Added to minimize vertical space
                children: [
                  TitleVideoDetailas(
                    courseId: courseId,
                    free: videos[index].isFree,
                    isfillexit: cubit.isfillgStatus(videos[index].title!),
                    video: videos[index],
                    isDownloading:
                        cubit.isFileDownloading(videos[index].title!),
                    progress: cubit.progressdouble,
                  ),
                  const Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class TitleVideoDetailas extends StatefulWidget {
  const TitleVideoDetailas({
    super.key,
    required this.video,
    required this.isDownloading,
    required this.progress,
    required this.isfillexit,
    required this.free,
    required this.courseId,
  });

  final Video video;
  final bool isDownloading;
  final bool free;
  final int courseId;

  final bool isfillexit;
  final double progress;

  @override
  State<TitleVideoDetailas> createState() => _TitleVideoDetailasState();
}

class _TitleVideoDetailasState extends State<TitleVideoDetailas> {
  final ValueNotifier<bool> fileExists = ValueNotifier(false);
  final ValueNotifier<String> filePaths = ValueNotifier('');

  Future<void> fileExist(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    fileExists.value = File(filePath).existsSync();
  }

  @override
  void initState() {
    super.initState();
    fileExist(widget.video.title!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.free
          ? () {
              context.read<VideoCourseCubit>().initializeVideo(
                  widget.video.url!,
                  widget.courseId,
                  widget.free,
                  widget.video.id ?? 0,
                  isfile: false);
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                // try {
                //   final directory = await getApplicationDocumentsDirectory();
                //   final filePath = '${directory.path}/${widget.video.title!}';

                //   if (File(filePath).existsSync()) {
                //     File(filePath).delete();
                //     log('File delete: $filePath');
                //   }
                // } catch (e) {
                //   log("Error checking local file: ${e.toString()}");
                // }
              },
              child: Container(
                width: 38.w,
                height: 38.h,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const ShapeDecoration(
                  color: Color(0xFFF4F8FE),
                  shape: OvalBorder(
                    side: BorderSide(width: 2, color: Color(0xFFE8F1FF)),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${widget.video.videoId}',
                    style: context.textStyle.titleSmall!.copyWith(
                      color: const Color(0xFF202244),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 1),
            Expanded(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Added to minimize vertical space
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.video.title!,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle.headlineSmall!.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xFF202244),
                    ),
                  ),
                  Text(
                    '15 Mins',
                    style: context.textStyle.displaySmall!.copyWith(
                      color: const Color(0xFF545454),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<VideoCourseCubit, VideoCourseState>(
                // buildWhen: (previous, current) => current is WatchVideoCourse,
                builder: (context, state) {
              bool watched = CacheHelper.isWatched(
                  widget.courseId.toString(), widget.video.id.toString());
              return watched
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Icon(Icons.video_library, color: Colors.grey);
            }),
            widget.isDownloading
                ? BlocSelector<VideoCourseCubit, VideoCourseState, double>(
                    selector: (state) =>
                        state is Progress ? state.progress : 0.0,
                    builder: (context, state) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: state,
                            strokeWidth: 2.5,
                            backgroundColor: Colors.grey.shade200,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue),
                          ),
                          Text(
                            '${(state * 100).toStringAsFixed(1)}%',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.blue),
                          ),
                        ],
                      );
                    },
                  )
                : ValueListenableBuilder<bool>(
                    valueListenable: fileExists,
                    builder: (context, fileExistsValue, child) {
                      return IconButton(
                          icon: widget.free
                              ? context
                                          .read<VideoCourseCubit>()
                                          .fillgStatus[widget.video.title!] ??
                                      fileExists.value
                                  ? Icon(
                                      Icons.play_circle_fill,
                                      color: const Color(0xFF0961F5),
                                      size: 23.sp,
                                    )
                                  : Icon(
                                      Icons.download,
                                      size: 23.sp,
                                    )
                              : Icon(
                                  Icons.lock,
                                  size: 23.sp,
                                ),
                          onPressed: onpress(context, fileExistsValue));
                    },
                  ),
          ],
        ),
      ),
    );
  }

  void Function()? onpress(BuildContext context, bool fileExistsValue) {
    return widget.free
        ? context.read<VideoCourseCubit>().fillgStatus[widget.video.title!] ??
                fileExistsValue
            ? () {}
            : () {
                context.read<VideoCourseCubit>().download(
                      widget.video.url!,
                      widget.video.title!,
                    );
              }
        : () {};
  }
}
