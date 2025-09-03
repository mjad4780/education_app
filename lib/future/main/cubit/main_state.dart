part of 'main_cubit.dart';

sealed class MainState {
  const MainState();
}

final class MainInitial extends MainState {}

final class MainIndex extends MainState {
  final int index;
  const MainIndex(this.index);
}
