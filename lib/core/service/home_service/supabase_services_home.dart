import 'dart:developer';

import 'package:education/core/success/return_response_service.dart';
import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';
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
            'videos':
                response.where((item) => item['is_video'] == true).toList(),
            'files':
                response.where((item) => item['is_video'] == false).toList(),
          }));
    } on Exception catch (e) {
      log("runtimeType${e.runtimeType}");
      log("dfalier${e.runtimeType}");
      return ResponseService(false, e.toString());
    }
  }
}
