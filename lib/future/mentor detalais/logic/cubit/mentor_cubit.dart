import 'package:bloc/bloc.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/mentor%20detalais/data/repo_courses_mentor.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'mentor_state.dart';

class MentorCubit extends Cubit<MentorState> {
  MentorCubit(this.repoCoursesMentor) : super(const MentorInitial());
  bool rebuildCourse = true;
  final RepoCoursesMentor repoCoursesMentor;
  int countfollwesmentor = 0;
  watchcourse(bool value) {
    emit(WatchRebuild(rebuildCourse = value));
  }

  getCoursesMentor(
    int mentorId,
  ) async {
    emit(const MentorCoursesLoading());
    final result = await repoCoursesMentor.getCoursesMentor(mentorId);
    result.fold(
      (failure) => emit(
        MentorCoursesFailer(failure.message),
      ),
      (success) => emit(
        MentorCoursesSuccess(success),
      ),
    );
  }

  updateFollowers(int mentorId) async {
    // countfollwesmentor
    // if (condition) {}
    // emit(UpdateFollewersLoading());

    final result = await repoCoursesMentor.updateFollowers(mentorId);
    result.fold(
        (failure) => emit(
              UpdateFollewersFailer(failure.message),
            ),
        (success) => emit(UpdateFollewersSuccess(success)));
  }

  // check chat mentor
  canChatWithMentor(int mentorId) async {
    // countfollwesmentor
    // if (condition) {}
    emit(const CheckChatLoading());

    final result = await repoCoursesMentor.canChatWithMentor(mentorId);
    result.fold(
      (failure) => emit(
        ChaeckChatFailer(failure.message),
      ),
      (success) => emit(
        const CheckChatSuccess(),
      ),
    );
  }
}
