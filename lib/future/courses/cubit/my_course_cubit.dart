import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_course_state.dart';

class MyCourseCubit extends Cubit<MyCourseState> {
  MyCourseCubit() : super(MyCourseInitial());

  // bool rebuildCourse = true;

  watchcourse(bool value) {
    emit(WatchRebuild(value));
  }
}
