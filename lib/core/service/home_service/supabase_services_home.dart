import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';
import 'package:education/future/home/data/model/response_home/response_home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServiceHome {
  final SupabaseClient supabase;
  SupabaseServiceHome(this.supabase);

  Future<ResponseHome> getHomeData() async {
    final responses = await Future.wait([
      supabase.from('categories').select(),
      supabase.from('mentors').select(),
      supabase.from('courses').select(),
    ]);
    return ResponseHome.fromMap({
      'categories': responses[0],
      'mentors': responses[1],
      'courses': responses[2],
    });
  }

  Future<DetailasCourse> getCourseDetails(int courseId) async {
    final response = await supabase
        .from('course_details')
        .select()
        .eq('course_detail_id', courseId);

    return DetailasCourse.fromJson({
      'course_detail_id': courseId,
      'videos': response.where((item) => item['is_video'] == true).toList(),
      'files': response.where((item) => item['is_video'] == false).toList(),
    });
  }
}
