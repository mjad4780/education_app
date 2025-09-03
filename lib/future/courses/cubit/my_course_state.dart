part of 'my_course_cubit.dart';

@immutable
sealed class MyCourseState {}

final class MyCourseInitial extends MyCourseState {}

final class WatchRebuild extends MyCourseState {
  final bool rebuild;

  WatchRebuild(this.rebuild);
}

//get course completed
final class MyCourseLoading extends MyCourseState {}

final class MyCourseSuccess extends MyCourseState {
  final List<Course> courses;

  MyCourseSuccess(this.courses);
}

final class MyCourseFailer extends MyCourseState {
  final String message;

  MyCourseFailer(this.message);
}

//update course
final class MyCourseUpdated extends MyCourseState {
  final int completed;

  MyCourseUpdated(this.completed);
}
