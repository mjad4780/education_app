import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;

import 'package:education/future/course%20detaias/data/repo/repo_video.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
part 'video_course_state.dart';

class VideoCourseCubit extends Cubit<VideoCourseState> {
  VideoCourseCubit(this._repoVideo) : super(VideoCourseInitial());
  late VideoPlayerController videoController;
  ChewieController? chewieController;
  final RepoVideo _repoVideo;
  bool rebuildCourse = true;
  String? fillpath;

  double progressdouble = 0.0;

  // خرائط لتعقب حالة التنزيل والتقدم لكل عنصر
  final Map<String, bool> downloadingStatus = {};
  final Map<String, bool> fillgStatus = {};

  final Map<String, double> progressStatus = {};

  // التقدم العام للعنصر
  double getProgress(String fileName) => progressStatus[fileName] ?? 0.0;
  bool isFileDownloading(String fileName) =>
      downloadingStatus[fileName] ?? false;
  bool isfillgStatus(String fileName) => fillgStatus[fileName] ?? false;
  Future<void> play(
    String url,
    String fileName,
  ) async {
    downloadingStatus[fileName] = true;
    progressStatus[fileName] = 0.0;
    emit(PlayLoading());
    final result = await _repoVideo.play(url, fileName, (received, total) {
      if (total > 0) {
        progressStatus[fileName] = received / total;
        emit(Progress(progressStatus[fileName]!));
      }
    });
    result.fold((failure) {
      downloadingStatus[fileName] = false;

      emit(
        PlayFailure(message: failure.message),
      );
    }, (success) {
      fillgStatus[fileName] = true;

      downloadingStatus[fileName] = false;

      fillpath = success.$2;
      emit(
        PlaySuccess(successString: success),
      );
    });
  }

  void initializeVideo(String videoPath, {bool isAsset = true}) async {
    try {
      if (chewieController != null) {
        videoController.dispose();
        chewieController!.dispose();
      }
      emit(VideoCourseLoading());
      videoController = isAsset
          ? VideoPlayerController.file(File(videoPath))
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

  watchcourse(bool value) {
    rebuildCourse = value;
    emit(WatchRebuild());
  }

  String fileTypes(String url) {
    try {
      final extension = p.extension(url).toLowerCase();

      if (extension == '.mp4') {
        return 'video';
      } else if (extension == '.pdf') {
        return 'pdf';
      } else {
        return 'unsupported $extension';
      }
    } catch (e) {
      log("Error determining file type: ${e.toString()}");
      return 'unknown';
    }
  }
}
