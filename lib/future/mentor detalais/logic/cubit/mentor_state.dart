part of 'mentor_cubit.dart';

@immutable
sealed class MentorState {}

final class MentorInitial extends MentorState {}

final class WatchRebuild extends MentorState {
  final bool rebuild;

  WatchRebuild(this.rebuild);
}
