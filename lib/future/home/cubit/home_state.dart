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
