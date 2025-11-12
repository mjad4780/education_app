part of 'video_course_cubit.dart';

sealed class VideoCourseState {}

final class VideoCourseInitial extends VideoCourseState {}

final class VideoCourseLoading extends VideoCourseState {}

final class WatchVideoCourse extends VideoCourseState {
  final bool videoId;

  WatchVideoCourse(this.videoId);
}

final class VideoCourseSuccess extends VideoCourseState {
  VideoCourseSuccess();
}

final class VideoCourseFailure extends VideoCourseState {
  final String message;
  VideoCourseFailure({required this.message});
}

//rebuild
final class WatchRebuild extends VideoCourseState {
  final int buttomrebuild;

  WatchRebuild(this.buttomrebuild);
}

///
final class PlayLoading extends VideoCourseState {}

final class PlaySuccess extends VideoCourseState {
  final (String?, String?, bool?) successString;

  PlaySuccess({required this.successString});
}

final class PlayFailure extends VideoCourseState {
  final String message;
  PlayFailure({required this.message});
}

///progress
final class Progress extends VideoCourseState {
  final double progress;

  Progress(this.progress);
}

final class DoneDownload extends VideoCourseState {
  final (bool, String) filexit;

  DoneDownload(this.filexit);
}

///////pdf
///
final class PlayPdfLoading extends VideoCourseState {}

final class PlayPdfSuccess extends VideoCourseState {
  final (String?, String?, bool?) successString;

  PlayPdfSuccess({required this.successString});
}

final class PlayPdfFailure extends VideoCourseState {
  final String message;
  PlayPdfFailure({required this.message});
}

final class ProgressPdf extends VideoCourseState {
  final double progress;

  ProgressPdf(this.progress);
}

///////////fillter course

final class FillterCourseSuccess extends VideoCourseState {
  final DetailasCourse fillterCourse;

  FillterCourseSuccess(this.fillterCourse);
}

final class VideoCourseDatailasLoading extends VideoCourseState {}

final class VideoCourseDatailasFailer extends VideoCourseState {
  final String message;
  VideoCourseDatailasFailer({required this.message});
}

//updateCourse
final class UpdateCourseLoading extends VideoCourseState {
  UpdateCourseLoading();
}

final class UpdateCourseSuccess extends VideoCourseState {
  final String messageSuccess;

  UpdateCourseSuccess(this.messageSuccess);
}

final class UpdateCourseFailer extends VideoCourseState {
  final String message;
  UpdateCourseFailer({required this.message});
}

// state watched video loading success failer
final class UpdateWatchedVideoLoading extends VideoCourseState {
  UpdateWatchedVideoLoading();
}

final class UpdateWatchedVideoSuccess extends VideoCourseState {
  final String messageSuccess;

  UpdateWatchedVideoSuccess(this.messageSuccess);
}

final class UpdateWatchedVideoFailer extends VideoCourseState {
  final String message;
  UpdateWatchedVideoFailer({required this.message});
}
