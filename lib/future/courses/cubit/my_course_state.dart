part of 'my_course_cubit.dart';

@immutable
sealed class MyCourseState {}

final class MyCourseInitial extends MyCourseState {}

final class WatchRebuild extends MyCourseState {
  final bool rebuild;

  WatchRebuild(this.rebuild);
}
