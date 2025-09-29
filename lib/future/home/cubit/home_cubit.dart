import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/future/home/data/repo/repo_home.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../data/model/response_home/course.dart';
import '../data/model/response_home/response_home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repoHome) : super(HomeInitial());
  static const String _hintKey = 'search_hints';
  Timer? debounceTimer;
  final prefs = getIt<CacheHelper>();
  final RepoHome repoHome;
  // int currentindex = 0;

  final TextEditingController query = TextEditingController();

  int currentindexpupalr = -1;

  saveEmit(HomeState state) {
    if (!isClosed) {
      emit(state);
    }
  }

  ResponseHome? responseHome;
  getData() async {
    _savedCourses.clear();
    _savedCourses.addAll(getIt<CacheHelper>().getSavedCourses());
    filltercourses.clear();
    saveEmit(LoadingHome());
    final result = await repoHome.getHomeData();
    result.fold(
      (failure) => saveEmit(
        FailerGetDataHome(failure.message),
      ),
      (success) => saveEmit(
        EmitgetDataHome(responseHome = success),
      ),
    );
  }

  List<Course> filltercourses = [];

  emitgetfilltergategoriescourse(String nameGategory, int index) {
    filltercourses.clear();
    saveEmit(FailtercourseLoadedState(index: currentindexpupalr = index));

    Future.delayed(const Duration(seconds: 3), () {
      if (nameGategory == "all") {
        filltercourses.addAll(responseHome!.courses!);
      }

      for (var element in responseHome!.courses!) {
        if (element.categoryName == nameGategory) {
          filltercourses.add(element);
        }
      }
      currentindexpupalr = index;
      saveEmit(FilterCourseSuccessState(filltercourses));
    });
  }

  // test save course
  final Set<String> _savedCourses = {};

  Future<void> initialize() async {
    // جلب الكورسات المحفوظة من الذاكرة المحلية عند التهيئة
    _savedCourses.addAll(getIt<CacheHelper>().getSavedCourses());
    saveEmit(HomeLoadedState());
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
    getIt<CacheHelper>().toggleCourseSave(courseId);

    // إشعار جميع الويدجت بالتحديث
    saveEmit(HomeUpdateFavoritesState(courseId));
  }

  bool isCourseSaved(String courseId) {
    return _savedCourses.contains(courseId);
  }

  //////////////////////////////////////// search course with debounce

  void searchWithDebounce([String? value]) {
    debounceTimer?.cancel();

    if (query.text.trim().isEmpty) {
      return;
    }

    debounceTimer = Timer(const Duration(milliseconds: 3000), () {
      _performSearch();
    });
  }

  Future<void> _performSearch() async {
    saveEmit(SearchCourseLoadingState());

    try {
      await Future.delayed(const Duration(seconds: 1)); // simulate API
      // هنا الفلترة بدل API
      final allCourses = responseHome?.courses ?? [];
      List<Course> results = allCourses
          .where((course) =>
              course.title != null &&
              course.title!.toLowerCase().contains(query.text.toLowerCase()))
          .toList();

      // save query to hints
      if (results.isEmpty || results == []) {
        debounceTimer?.cancel();
        saveEmit(SearchCourseFailerState(
            messege: "No results found for '${query.text}'"));

        return;
      } else {
        debounceTimer?.cancel();

        await addHint(query.text);

        saveEmit(SearchCourseSuccessState(results));
      }
    } catch (e) {
      debounceTimer?.cancel();
      log(e.toString());
      saveEmit(SearchCourseFailerState(messege: "Something went wrong: $e"));
    }
  }

  void immediateSearch([String? value]) {
    debounceTimer?.cancel();
    if (query.text.trim().isNotEmpty) {
      _performSearch();
    } else if (value != null && value.trim().isNotEmpty) {
      query.text = value;
      _performSearch();
    }
  }

  void loadSavedHints() {
    final current = getIt<CacheHelper>().getStringList(key: _hintKey);
    saveEmit(SearchHintTextState(current));
  }

  Future<void> addHint(String hint) async {
    final current = getIt<CacheHelper>().getStringList(key: _hintKey);
    if (!current.contains(hint)) {
      current.add(hint);
      await getIt<CacheHelper>().removeData(key: _hintKey);

      await getIt<CacheHelper>().setStringList(key: _hintKey, value: current);
    }
    // saveEmit(SearchHintTextState(current));
  }

  Future<void> removeHint(String hint) async {
    final current = getIt<CacheHelper>().getStringList(key: _hintKey);
    current.remove(hint);
    await getIt<CacheHelper>().removeData(key: _hintKey);
    await getIt<CacheHelper>().setStringList(key: _hintKey, value: current);
    saveEmit(SearchHintTextState(current));
  }

  @override
  Future<void> close() {
    debounceTimer?.cancel();
    return super.close();
  }
}
