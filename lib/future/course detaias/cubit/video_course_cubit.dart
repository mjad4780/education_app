import 'dart:developer';
import 'dart:io';
import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:education/future/course%20detaias/data/repo/repo_video.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../../../detailas.dart';
import '../../home/data/model/response_home/course.dart';
part 'video_course_state.dart';

class VideoCourseCubit extends Cubit<VideoCourseState> {
  VideoCourseCubit(this._repoVideo) : super(VideoCourseInitial());
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
      emit(VideoCourseFailure(message: e.toString()));
    }
  }

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
  List<Detailashome> listcourse = [];
  Course? headCourse;
  Detailashome? fillterCourse;
  emitgetcourse(Course course) {
    headCourse = course;
    for (var element in detailascourse) {
      listcourse.add(Detailashome.fromJson(element));
    }
    fillterCourse = listcourse.firstWhere(
      (e) => e.detailsId == course.id,
    );
    emit(FillterCourse(fillterCourse!));
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
