part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class UpdateCurrentIndex extends HomeState {
  final int index;

  UpdateCurrentIndex(this.index);
}

final class UpdateCurrentIndexPoluapr extends HomeState {
  final int index;

  UpdateCurrentIndexPoluapr(this.index);
}

// get home
final class LoadingHome extends HomeState {}

final class EmitgetDataHome extends HomeState {
  final ResponseHome responseHome;
  final List<Course> course;

  EmitgetDataHome(this.responseHome, this.course);
}

//TEST save course  HomeLoadedState and HomeUpdateFavoritesState
final class HomeLoadedState extends HomeState {}

final class HomeUpdateFavoritesState extends HomeState {
  final String courseId;

  HomeUpdateFavoritesState(this.courseId);
}

// filter course
final class FailtercourseLoadedState extends HomeState {
  final int index;

  FailtercourseLoadedState({required this.index});
}

final class FilterCourseState extends HomeState {
  final List<Course> courses;

  FilterCourseState(this.courses);
}
