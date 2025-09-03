import 'dart:developer';
import 'dart:io';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:education/future/course%20detaias/data/repo/repo_video.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../../home/data/model/response_home/course.dart';
part 'video_course_state.dart';

class VideoCourseCubit extends Cubit<VideoCourseState> {
  VideoCourseCubit(
    this._repoVideo,
  ) : super(VideoCourseInitial()) {
    getIt<CacheHelper>().removeData(key: 'watched_videos');
  }

  late VideoPlayerController videoController;
  ChewieController? chewieController;
  final RepoVideo _repoVideo;
  int rebuildCourse = 0;
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

  Future<bool> videolocal(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    return File(filePath).existsSync();
  }

//liner progress couese
  Map<int, bool> watchedVideos =
      {}; // مفتاحه هو معرف الفيديو وقيمته إذا كان قد شوهد
  String again = '';
  int? videoId;
  void initializeVideo(String videoPath, {bool isfile = true}) async {
    try {
      again = videoPath;
      if (chewieController != null) {
        videoController.dispose();
        chewieController!.dispose();
      }
      emit(VideoCourseLoading());
      bool isfiles = await videolocal(videoPath);
      videoController = isfiles
          ? VideoPlayerController.file(File(videoPath))
          : VideoPlayerController.networkUrl(Uri.parse(videoPath));

      await videoController.initialize();
      videoController.addListener(() {
        if (videoController.value.position >= videoController.value.duration &&
            videoId != null) {
          if (!watchedVideos.containsKey(videoId) || !watchedVideos[videoId]!) {
            watchedVideos[videoId!] = true;
            getIt<CacheHelper>().saveWatchedVideos(watchedVideos);
            emit(WatchVideoCourse(videoId!));
          }
        }
      });

      // Set timeout
      Future.delayed(const Duration(seconds: 15), () {
        if (state is VideoCourseLoading) {
          emit(VideoCourseFailure(
              message:
                  'تحميل الفيديو استغرق وقتًا طويلاً. تحقق من اتصالك بالإنترنت.'));
        }
      });

      chewieController = ChewieController(
        videoPlayerController: videoController,
        autoPlay: false,
        looping: false,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              'حدث خطأ أثناء تشغيل الفيديو: $errorMessage',
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
      );
      emit(VideoCourseSuccess());
    } catch (e) {
      log(e.toString());
      emit(VideoCourseFailure(message: 'تحقق من اتصالك بالإنترنت'));
    }
  }

////////////////

  watchcourse(int value) {
    emit(WatchRebuild(rebuildCourse = value));
  }

/////play pdf
  final Map<String, bool> downloadingStatuspdf = {};
  final Map<String, bool> fillgStatuspdf = {};

  final Map<String, double> progressStatuspdf = {};

  double getProgresspdf(String fileName) => progressStatuspdf[fileName] ?? 0.0;
  bool isFileDownloadingpdf(String fileName) =>
      downloadingStatuspdf[fileName] ?? false;
  bool isfillgStatuspdf(String fileName) => fillgStatuspdf[fileName] ?? false;
  double progressdoublepdf = 0.0;
  String? fillpathpdf;

  Future<void> playpdf(
    String url,
    String fileName,
  ) async {
    downloadingStatuspdf[fileName] = true;
    progressStatuspdf[fileName] = 0.0;
    emit(PlayPdfLoading());
    final result = await _repoVideo.play(url, fileName, (received, total) {
      if (total > 0) {
        progressStatuspdf[fileName] = received / total;
        emit(ProgressPdf(progressStatuspdf[fileName]!));
      }
    });
    result.fold((failure) {
      downloadingStatuspdf[fileName] = false;

      emit(
        PlayPdfFailure(message: failure.message),
      );
    }, (success) {
      fillgStatuspdf[fileName] = true;

      downloadingStatuspdf[fileName] = false;

      fillpathpdf = success.$2;

      emit(
        PlayPdfSuccess(successString: success),
      );
    });
  }

  ///////////////////////////////////////////test model video
  Course? headCourse;
  String initialVideo = '';
  int totalvideos = 0;
  Future<void> emitgetdataliascourse(Course course, int courseId) async {
    try {
      if (isClosed) return;

      emit(VideoCourseDatailasLoading());
      headCourse = course;

      final result = await _repoVideo.getCourseDetails(courseId);

      if (isClosed) return;

      result.fold((failure) {
        emit(VideoCourseDatailasFailer(message: failure.message));
      }, (success) {
        totalvideos = success.videos!.length;
        videoId = success.videos!.first.id;
        initialVideo = success.videos!.first.url!;
        emit(FillterCourseSuccess(success));
      });
    } catch (e) {
      if (!isClosed) {
        emit(VideoCourseDatailasFailer(message: e.toString()));
      }
    }
  }

//update course
  updateCourseToFree(int courseId) async {
    emit(UpdateCourseLoading());

    final result = await _repoVideo.updateCourseToFree(courseId);
    result.fold((failure) {
      emit(
        UpdateCourseFailer(message: failure.message),
      );
    }, (success) {
      emit(
        UpdateCourseSuccess(success),
      );
    });
  }

  deleteVideoCache(String title) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$title';

      if (File(filePath).existsSync()) {
        File(filePath).delete();
        log('File delete: $filePath');
      }
    } catch (e) {
      log("Error checking local file: ${e.toString()}");
    }
  }
}
