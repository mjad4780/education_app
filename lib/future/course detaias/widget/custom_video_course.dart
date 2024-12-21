import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/video_course_cubit.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoCourseCubit videoCourseCubit;

  @override
  void initState() {
    super.initState();
    videoCourseCubit = context.read<VideoCourseCubit>();
    videoCourseCubit.initializeVideo(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        isAsset: false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCourseCubit, VideoCourseState>(
      builder: (context, isInitialized) {
        return videoCourseCubit.chewieController != null &&
                videoCourseCubit.videoController.value.isInitialized
            ? Chewie(controller: videoCourseCubit.chewieController!)
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void dispose() {
    videoCourseCubit.videoController.dispose();
    if (videoCourseCubit.chewieController != null) {
      videoCourseCubit.chewieController!.dispose();
    }

    super.dispose();
  }
}
