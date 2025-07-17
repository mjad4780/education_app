import 'dart:developer';

import 'package:education/core/error/error_handler_supabase.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/core/success/return_response_service.dart';
import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/data/model/response_home/response_home.dart';
import 'package:education/utility/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServiceHome {
  final SupabaseClient supabase;
  SupabaseServiceHome(this.supabase);

//:get home data
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
    } catch (e) {
      log("runtimeType${e.toString()}");
      return ResponseService(false, ErrorHandlerSupabase.getErrorMessage(e));
    }
  }
//:get Course Details

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
    } catch (e) {
      log("dfalier${e.runtimeType}");
      return ResponseService(false, ErrorHandlerSupabase.getErrorMessage(e));
    }
  }
//:update CourseTo

  Future<ResponseService> updateCourseTo(int courseId) async {
    try {
      await Future.wait([
        supabase.from('courses').update({'is_free': true}).eq('id', courseId),
        supabase
            .from('course_details')
            .update({'is_free': true}).eq('course_detail_id', courseId),
      ]);
      return ResponseService(true, "تم التحديث بنجاح!");
    } catch (e) {
      log('خطأ أثناء التحديث: $e');
      return ResponseService(false, ErrorHandlerSupabase.getErrorMessage(e));
    }
  }
//:get Completed Course

  Future<ResponseService<List<Course>>> getCompletedCourse() async {
    try {
      final responses =
          await supabase.from('courses').select().eq('is_free', true);

      // Convert the response data to List<Course> and handle empty responses
      final coursesList = (responses as List).isNotEmpty
          ? (responses as List).map((course) => Course.fromMap(course)).toList()
          : <Course>[];

      return ResponseService(true, '', coursesList);
    } catch (e) {
      log("runtimeType${e.toString()}");
      return ResponseService(false, ErrorHandlerSupabase.getErrorMessage(e));
    }
  }

///////get courses mentors
  Future<ResponseService<List<Course>>> getCoursesMentor(int mentorId) async {
    try {
      final response =
          await supabase.from('courses').select().eq('mentor_id', mentorId);
      final coursesList = (response as List).isNotEmpty
          ? (response as List).map((course) => Course.fromMap(course)).toList()
          : <Course>[];
      return ResponseService(true, '', coursesList);
    } catch (e) {
      log("runtimeType${e.runtimeType}");
      return ResponseService(false, ErrorHandlerSupabase.getErrorMessage(e));
    }
  }

  //:updata followers

  Future<ResponseService<List<String>>> toggleFollower(
    int mentorId,
  ) async {
    try {
      var followerId = getIt<CacheHelper>().getData(key: Keys.userId) ?? '';
      // جلب بيانات المرشد الحالية
      final response = await supabase
          .from('mentors')
          .select('followers')
          .eq('id', mentorId)
          .single();

      List<String> currentFollowers =
          (response['followers'] as List<dynamic>? ?? [])
              .map((e) => e.toString())
              .toList();

      log('currentFollowers$currentFollowers');

      bool isAdding = !currentFollowers.contains(followerId);
      List<String> newlist = [];
      if (isAdding) {
        // حالة الإضافة
        newlist = [...currentFollowers, followerId];

        await supabase.from('mentors').update({
          'followers': newlist,
        }).eq('id', mentorId);
        return ResponseService(true, "تمت إضافة المتابع بنجاح", newlist);
      } else {
        newlist = currentFollowers.where((f) => f != followerId).toList();
        // حالة الحذف
        await supabase
            .from('mentors')
            .update({'followers': newlist}).eq('id', mentorId);
        return ResponseService(true, "تمت إزالة المتابع بنجاح", newlist);
      }
    } catch (e) {
      log('خطأ في قاعدة البيانات: ${e.toString()}');
      return ResponseService(
          false, ErrorHandlerSupabase.getErrorMessage(e), []);
    }
  }
  //chat mentor

  Future<ResponseService<bool>> canChatWithMentor(int mentorId) async {
    try {
      // تحقق من وجود كورسات مجانية للمدرس
      final freeCourses = await supabase
          .from('courses')
          .select()
          .eq('mentor_id', mentorId)
          .eq('is_free', true);
      log('freeCourses: $freeCourses');
      if (freeCourses.isEmpty) {
        return ResponseService(
            false, 'لا يمكن التكلم مع هذا المدرس إلا بعد شراء كورس له', false);
      } else {}

      return ResponseService(true, 'يمكنك التحدث مع هذا المدرس', true);
    } catch (e) {
      log(e.toString());
      return ResponseService(
          false, ErrorHandlerSupabase.getErrorMessage(e), false);
    }
  }
}
