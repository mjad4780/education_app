part of 'mentor_cubit.dart';

//import 'package:equatable/equatable.dart';
@immutable
sealed class MentorState extends Equatable {
  const MentorState();

  @override
  List<Object?> get props => [];
}

final class MentorInitial extends MentorState {
  const MentorInitial();
}

final class WatchRebuild extends MentorState {
  final bool rebuild;

  const WatchRebuild(this.rebuild);

  @override
  List<Object?> get props => [rebuild];
}

//state get courses mentor
final class MentorCoursesLoading extends MentorState {
  const MentorCoursesLoading();
}

final class MentorCoursesSuccess extends MentorState {
  final List<Course> coursesMentor;

  const MentorCoursesSuccess(this.coursesMentor);

  @override
  List<Object?> get props => [coursesMentor];
}

final class MentorCoursesFailer extends MentorState {
  final String message;

  const MentorCoursesFailer(this.message);

  @override
  List<Object?> get props => [message];
}

//state UpdateFollewers
final class UpdateFollewersLoading extends MentorState {
  const UpdateFollewersLoading();
}

final class UpdateFollewersSuccess extends MentorState {
  final List<String> followers;

  const UpdateFollewersSuccess(this.followers);

  @override
  List<Object?> get props => [followers];
}

final class UpdateFollewersFailer extends MentorState {
  final String message;

  const UpdateFollewersFailer(this.message);

  @override
  List<Object?> get props => [message];
}

//check chat with mentor
final class CheckChatLoading extends MentorState {
  const CheckChatLoading();
}

final class CheckChatSuccess extends MentorState {
  const CheckChatSuccess();
}

final class ChaeckChatFailer extends MentorState {
  final String message;

  const ChaeckChatFailer(this.message);

  @override
  List<Object?> get props => [message];
}
