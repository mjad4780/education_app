import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/future/home/data/repo/repo_home.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/model/response_home/course.dart';
import '../data/model/response_home/response_home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repoHome) : super(HomeInitial());
  final supabase = Supabase.instance.client;
  final RepoHome repoHome;
  // int currentindex = 0;

  int currentindexpupalr = -1;

  ResponseHome? responseHome;
  getData() async {
    _savedCourses.clear();
    _savedCourses.addAll(getIt<CacheHelper>().getSavedCourses());
    log(_savedCourses.length.toString());
    filltercourses.clear();
    emit(LoadingHome());
    final result = await repoHome.getHomeData();
    result.fold(
      (failure) => emit(
        FailerGetDataHome(failure.message),
      ),
      (success) => emit(
        EmitgetDataHome(responseHome = success),
      ),
    );
  }

  List<Course> filltercourses = [];

  emitgetfilltergategoriescourse(String nameGategory, int index) {
    filltercourses.clear();
    log(responseHome!.courses!.length.toString());
    emit(FailtercourseLoadedState(index: currentindexpupalr = index));

    Future.delayed(const Duration(seconds: 3), () {
      if (nameGategory == "all") {
        log('all${filltercourses.length}');

        filltercourses.addAll(responseHome!.courses!);
        log(responseHome!.courses!.length.toString());
      }

      for (var element in responseHome!.courses!) {
        if (element.categoryName == nameGategory) {
          log('fillter');
          filltercourses.add(element);
          log('fillter${filltercourses.length}');
        }
      }
      currentindexpupalr = index;
      emit(FilterCourseSuccessState(filltercourses));
    });
  }

  // test save course
  final Set<String> _savedCourses = {};

  Future<void> initialize() async {
    // جلب الكورسات المحفوظة من الذاكرة المحلية عند التهيئة
    _savedCourses.addAll(getIt<CacheHelper>().getSavedCourses());
    log(_savedCourses.length.toString());
    emit(HomeLoadedState());
  }

  Future<void> toggleCourseSave(String courseId) async {
    // تبديل الحالة
    if (_savedCourses.contains(courseId)) {
      log('remove');
      _savedCourses.remove(courseId);
    } else {
      log('add');

      _savedCourses.add(courseId);
    }

    // حفظ في الذاكرة المحلية
    await getIt<CacheHelper>().toggleCourseSave(courseId);

    // إشعار جميع الويدجت بالتحديث
    emit(HomeUpdateFavoritesState(courseId));
  }

  bool isCourseSaved(String courseId) {
    return _savedCourses.contains(courseId);
  }
}
