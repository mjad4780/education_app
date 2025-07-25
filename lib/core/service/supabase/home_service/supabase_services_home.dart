import 'dart:developer';
import 'dart:io';

import 'package:education/core/error/error_handler_supabase.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/core/success/return_response_service.dart';
import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/data/model/response_home/response_home.dart';
import 'package:education/utility/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../future/profile/data/model/profile_model.dart';

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

// update user

  Future<ResponseService<bool>> updateUser(
      UserAttributes user, File? file, String path) async {
    try {
      var pathProfile = await updateImageProfile(file, path);
      if (pathProfile.data != null && pathProfile.data == true) {
        await supabase.auth.updateUser(
          user,
          emailRedirectTo: user.email,
        );

        return ResponseService(true, 'success update user ', true);
      } else {
        return ResponseService(false, 'error update user ', false);
      }
      // تحقق من وجود كورسات مجانية للمدرس
    } catch (e) {
      log(e.toString());
      return ResponseService(
          false, ErrorHandlerSupabase.getErrorMessage(e), false);
    }
  }

  Future<ResponseService<String?>> updateImageProfile(
      File? file, String? path) async {
    try {
      if (file != null && path == null) {
        log('upload');

        // إنشاء اسم ملف فريد
        String fileName =
            '${DateTime.now().millisecondsSinceEpoch}${file.path.split('.').last}';

        await supabase.storage.from('profile').upload(fileName, file);
        String urlImage =
            supabase.storage.from('profile').getPublicUrl(fileName);

        return ResponseService(true, ' success upload image ', urlImage);
      } else if (file != null && path != null) {
        final uri = Uri.parse(path);
        var filePath =
            uri.path.split('/').last; // يعطي "users/user1/avatar.jpg"

        await supabase.storage.from('profile').update(filePath, file);
        String urlImage =
            supabase.storage.from('profile').getPublicUrl(filePath);

        return ResponseService(true, ' success upload image ', urlImage);
      } else {
        return ResponseService(false, ' No image ', null);
      }
    } catch (e) {
      log(e.toString());
      return ResponseService(
          false, ErrorHandlerSupabase.getErrorMessage(e), null);
    }
  }

  // implement function get user from supabase
  Future<ResponseService<User?>> getUser() async {
    try {
      final user = supabase.auth.currentUser;

      if (user != null) {
        log({'appMetadata': user.appMetadata}.toString());
        log({'userMetadata': user.userMetadata}.toString());

        return ResponseService(true, 'تم جلب المستخدم بنجاح', user);
      } else {
        return ResponseService(false, 'لم يتم العثور على مستخدم', null);
      }
    } catch (e) {
      log(e.toString());
      return ResponseService(
          false, ErrorHandlerSupabase.getErrorMessage(e), null);
    }
  }

// implement update user and edit image profile from supabase

  Future<ResponseService<User?>> updateUserAndImageProfile({
    required ProfileModel profileModel,
  }) async {
    try {
      String? uploadedImageUrl;
      if (profileModel.imageFile != null) {
        final uploadResult = await updateImageProfile(
            profileModel.imageFile, profileModel.imagePath);
        if (uploadResult.result == true && uploadResult.data != null) {
          uploadedImageUrl = uploadResult.data;
        } else {
          return ResponseService(
            false,
            'Failed to upload image ${uploadResult.messege}',
          );
        }
      }
      log(' old url ${profileModel.imagePath ?? ''}');
      log(' new url ${uploadedImageUrl ?? ''}    ');

      final user = supabase.auth.currentUser;
      if (user == null) {
        return ResponseService(
          false,
          'المستخدم غير موجود',
        );
      }

      final updateAttributes = UserAttributes(
        data: profileModel.data
            ?.toJson(uploadedImageUrl ?? profileModel.imagePath),
      );

      var result = await supabase.auth.updateUser(updateAttributes);

      return ResponseService(true, 'تم تحديث المستخدم بنجاح', result.user);
    } catch (e) {
      log(e.toString());
      return ResponseService(
        false,
        ErrorHandlerSupabase.getErrorMessage(e),
      );
    }
  }
}
