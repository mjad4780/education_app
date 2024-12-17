part of 'video_course_cubit.dart';

@immutable
sealed class VideoCourseState {}

final class VideoCourseInitial extends VideoCourseState {}

final class VideoCourseLoading extends VideoCourseState {}

final class VideoCourseSuccess extends VideoCourseState {
  VideoCourseSuccess();
}

final class VideoCourseFailure extends VideoCourseState {
  final String message;
  VideoCourseFailure({required this.message});
}

//rebuild
final class WatchRebuild extends VideoCourseState {}
