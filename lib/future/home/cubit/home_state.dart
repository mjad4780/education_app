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

final class EmitgetDataHome extends HomeState {
  final ResponseHome responseHome;

  EmitgetDataHome(this.responseHome);
}

//TEST save course  HomeLoadedState and HomeUpdateFavoritesState
final class HomeLoadedState extends HomeState {}

final class HomeUpdateFavoritesState extends HomeState {
  final String courseId;

  HomeUpdateFavoritesState(this.courseId);
}
