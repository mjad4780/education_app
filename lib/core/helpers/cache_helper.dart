import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

//! Here The Initialize of cache .
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

//! this method to put data in local database using key

  String? getDataString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

//! this method to put data in local database using key

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

//! this method to get data already saved in local database

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  List<String> getStringList({required String key}) {
    return sharedPreferences.getStringList(key)?.toList() ?? [];
  }

  Future<bool> setStringList(
      {required String key, required List<String> value}) async {
    return await sharedPreferences.setStringList(key, value);
  }

//! remove data using specific key

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

//! this method to check if local database contains {key}
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

//! clear all data in the local database
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

//! this method to put data in local database using key
  Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

  Future<void> cachedlanguagecode(String languagecode) async {
    sharedPreferences.setString("LOCALE", languagecode);
  }

  Future<String> getCachedlanguagecode() async {
    final cachedLanguagecode = sharedPreferences.getString("LOCALE");
    if (cachedLanguagecode != null) {
      return cachedLanguagecode;
    } else {
      return "en";
    }
  }

  //test save course
  // داخل class CacheHelper
  static const String _savedCoursesKey = 'saved_courses';

  Future<bool> toggleCourseSave(String courseId) async {
    final savedCourses = getSavedCourses();
    final isSaved = savedCourses.contains(courseId);

    if (isSaved) {
      savedCourses.remove(courseId);
    } else {
      savedCourses.add(courseId);
    }

    return await sharedPreferences.setStringList(
      _savedCoursesKey,
      savedCourses.toList(),
    );
  }

  Set<String> getSavedCourses() {
    return sharedPreferences.getStringList(_savedCoursesKey)?.toSet() ?? {};
  }

  static const String _watchedVideosKey = 'watched_videos';

  Future<void> saveWatchedVideos(Map<int, bool> watchedVideos) async {
    // تحويل المفاتيح إلى String
    final stringKeyMap =
        watchedVideos.map((key, value) => MapEntry(key.toString(), value));
    await sharedPreferences.setString(
      _watchedVideosKey,
      json.encode(stringKeyMap),
    );
  }

  Map<int, bool> getWatchedVideos() {
    final data = sharedPreferences.getString(_watchedVideosKey);
    if (data != null) {
      final Map<String, dynamic> stringKeyMap = json.decode(data);
      // تحويل المفاتيح مرة أخرى إلى int
      return stringKeyMap
          .map((key, value) => MapEntry(int.parse(key), value as bool));
    }
    return {};
  }
}
