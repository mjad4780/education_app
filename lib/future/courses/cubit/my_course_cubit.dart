import 'package:bloc/bloc.dart';

import 'package:education/future/courses/data/repo_my_course.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:meta/meta.dart';

import '../../../core/helpers/cache_helper.dart';

part 'my_course_state.dart';

class MyCourseCubit extends Cubit<MyCourseState> {
  MyCourseCubit(this.repoMyCourse) : super(MyCourseInitial());

  final RepoMyCourse repoMyCourse;

  int completedVideos = 0;

  getCompletedCourse() async {
    emit(MyCourseLoading());
    final result = await repoMyCourse.getCompletedCourse();
    result.fold(
      (failure) => emit(
        MyCourseFailer(failure.message),
      ),
      (success) => emit(
        MyCourseSuccess(success),
      ),
    );
  }
}
