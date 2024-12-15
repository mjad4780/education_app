import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
part 'video_course_state.dart';

class VideoCourseCubit extends Cubit<VideoCourseState> {
  VideoCourseCubit() : super(VideoCourseInitial());
  late VideoPlayerController videoController;
  ChewieController? chewieController;
  void initializeVideo(String videoPath, {bool isAsset = true}) async {
    try {
      if (chewieController != null) {
        videoController.dispose();
        chewieController!.dispose();
      }
      emit(VideoCourseLoading());
      videoController = isAsset
          ? VideoPlayerController.asset(videoPath)
          : VideoPlayerController.networkUrl(Uri.parse(videoPath));

      await videoController.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoController,
        autoPlay: false,
        looping: false,
      );
      emit(VideoCourseSuccess());

      // emit(true); // تحديث الحالة إلى "جاهز"
    } catch (e) {
      log(e.toString());
      emit(VideoCourseFailure(message: e.toString()));
    }
  }
}
