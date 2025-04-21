import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/video_course_cubit.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoCourseCubit videoCourseCubit;

  @override
  void initState() {
    super.initState();
    videoCourseCubit = context.read<VideoCourseCubit>();
    if (videoCourseCubit.fillterCourse!.videos!.first.url != null) {
      videoCourseCubit.initializeVideo(
        // 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        videoCourseCubit.fillterCourse!.videos!.first.url!,
        isfile: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCourseCubit, VideoCourseState>(
      builder: (context, state) {
        final videoCourseCubit = context.read<VideoCourseCubit>();

        // Handle different states
        if (state is VideoCourseFailure) {
          return _buildErrorWidget(state.message, context);
        }

        // Check if video is initialized
        else if (videoCourseCubit.chewieController != null &&
            // videoCourseCubit.videoController.value.isInitialized &&
            state is VideoCourseSuccess) {
          return Chewie(controller: videoCourseCubit.chewieController!);
        } else if (state is VideoCourseLoading) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: Colors.blue),
                SizedBox(height: 16),
                Text('جاري تحميل الفيديو...'),
              ],
            ),
          );
        } else {
          // Still loading
          return _buildErrorWidget('', context);
        }
      },
    );
  }

  Widget _buildErrorWidget(String message, BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 48, color: Colors.red.shade400),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              videoCourseCubit.initializeVideo(videoCourseCubit.again,
                  isfile: false);
            },
            icon: const Icon(Icons.refresh),
            label: const Text('حاول مجددًا'),
          ),
        ],
      ),
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
