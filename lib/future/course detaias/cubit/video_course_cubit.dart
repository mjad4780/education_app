import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;

import 'package:education/future/course%20detaias/data/repo/repo_video.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../data/models/response_pdf/response_pdf.dart';
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
      log(e.toString());
      emit(VideoCourseFailure(message: e.toString()));
    }
  }

  watchcourse(int value) {
    emit(WatchRebuild(rebuildCourse = value));
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

  List<ResponsePdf> responsepdf = [];

  List<ResponsePdf> decodeResponsePdf() {
    for (var element in pdfData) {
      ResponsePdf pdf = ResponsePdf.fromJson(element);
      responsepdf.add(pdf);
    }
    return responsepdf;
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
}
