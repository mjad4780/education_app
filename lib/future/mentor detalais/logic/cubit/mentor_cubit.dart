import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mentor_state.dart';

class MentorCubit extends Cubit<MentorState> {
  MentorCubit() : super(MentorInitial());
  bool rebuildCourse = true;

  watchcourse(bool value) {
    emit(WatchRebuild(rebuildCourse = value));
  }
}
