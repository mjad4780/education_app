import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:meta/meta.dart';

import '../../../json.dart';
import '../data/model/response_home/course.dart';
import '../data/model/response_home/response_home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    // initialize();
  }
  int currentindex = 0;

  updatecurrentendex(int index) {
    emit(UpdateCurrentIndex(currentindex = index));
  }

  int currentindexpupalr = 0;

  // updatecurrentendexbuplar(int index) {
  //   emit(UpdateCurrentIndexPoluapr(currentindexpupalr = index));
  // }

  ResponseHome? responseHome;
  getData() {
    emit(LoadingHome());
    Future.delayed(const Duration(seconds: 1), () {
      responseHome = ResponseHome.fromMap(responsehome);
      emit(EmitgetDataHome(responseHome!));
    });
  }

  List<Course> filltercourses = [];

  emitgetfilltergategoriescourse(String nameGategory, int index) {
    filltercourses.clear();
    emit(FailtercourseLoadedState(index: currentindexpupalr = index));

    Future.delayed(const Duration(seconds: 0), () {
      for (var element in responseHome!.platform!.courses!) {
        if (element.categoryName == nameGategory) {
          filltercourses.add(element);
        }
      }
      currentindexpupalr = index;
      emit(FilterCourseState(filltercourses));
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
