import 'dart:developer';

import 'package:education/core/success/return_response_service.dart';
import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/data/model/response_home/response_home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServiceHome {
  final SupabaseClient supabase;
  SupabaseServiceHome(this.supabase);

  Future<ResponseService<ResponseHome>> getHomeData() async {
    try {
      final responses = await Future.wait([
        supabase.from('categories').select(),
        supabase.from('mentors').select(),
        supabase.from('courses').select(),
      ]);
      return ResponseService(
          true,
          '',
          ResponseHome.fromMap({
            'categories': responses[0],
            'mentors': responses[1],
            'courses': responses[2],
          }));
    } on Exception catch (e) {
      log("runtimeType${e.toString()}");
      return ResponseService(false, "try again ");
    }
  }

  Future<ResponseService<DetailasCourse>> getCourseDetails(int courseId) async {
    try {
      final response = await supabase
          .from('course_details')
          .select()
          .eq('course_detail_id', courseId);

      return ResponseService(
          true,
          '',
          DetailasCourse.fromJson({
            'course_detail_id': courseId,
            'files':
                response.where((item) => item['is_video'] == false).toList(),
            'videos':
                response.where((item) => item['is_video'] == true).toList(),
          }));
    } on Exception catch (e) {
      log("runtimeType${e.runtimeType}");
      log("dfalier${e.runtimeType}");
      return ResponseService(false, "try again ");
    }
  }

  Future<ResponseService> updateCourseTo(int courseId) async {
    try {
      await Future.wait([
        supabase.from('courses').update({'is_free': true}).eq('id', courseId),
        supabase
            .from('course_details')
            .update({'is_free': true}).eq('course_detail_id', courseId),
      ]);
      return ResponseService(true, "تم التحديث بنجاح!");
    } on Exception catch (e) {
      log('خطأ أثناء التحديث: $e');
      return ResponseService(false, "تم التحديث بنجاح!");
    }
  }

  Future<ResponseService<List<Course>>> getCompletedCourse() async {
    try {
      final responses =
          await supabase.from('courses').select().eq('is_free', true);

      // Convert the response data to List<Course> and handle empty responses
      final coursesList = (responses as List).isNotEmpty
          ? (responses as List).map((course) => Course.fromMap(course)).toList()
          : <Course>[];

      return ResponseService(true, '', coursesList);
    } on Exception catch (e) {
      log("runtimeType${e.toString()}");
      return ResponseService(false, "try again ");
    }
  }
}
