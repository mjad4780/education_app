import 'dart:developer';
import 'dart:io';

import 'package:education/core/error/error_handler_supabase.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/features/course_detaias/data/models/detailashome/detailas_home.dart';
import 'package:education/features/home/data/model/response_home/course.dart';
import 'package:education/features/home/data/model/response_home/response_home.dart';
import 'package:education/utility/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../features/profile/data/model/profile_model.dart';
import '../../../helpers/return_response_service.dart';

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

  Future<ResponseService<DetailasCourse>> getCourseDetails(
      int courseId, bool isfree) async {
    try {
      final response = await supabase
          .from('course_details')
          .select()
          .eq('course_detail_id', courseId)
          .order('id', ascending: true);

      return ResponseService(
          true,
          '',
          DetailasCourse.fromJson({
            'course_detail_id': courseId,
            'files':
                response.where((item) => item['is_video'] == false).toList(),
            'videos':
                response.where((item) => item['is_video'] == true).toList(),
          }, isfree));
    } catch (e) {
      log("dfalier${e.runtimeType}");
      return ResponseService(false, ErrorHandlerSupabase.getErrorMessage(e));
    }
  }
//:update CourseTo

  Future<ResponseService> updateCourseTo(int courseId) async {
    try {
      final user = getIt<CacheHelper>().getData(key: Keys.userId);
      if (user == null) {
        return ResponseService(false, "يجب تسجيل الدخول أولاً");
      }

      // أولاً: نجلب القائمة الحالية
      final currentCourse = await supabase
          .from('courses')
          .select('users_course')
          .eq('id', courseId)
          .single();

      List<dynamic> currentUsers = currentCourse['users_course'] ?? [];

      // ثانياً: نضيف user_id الجديد إذا لم يكن موجود
      if (!currentUsers.contains(user.id)) {
        currentUsers.add(user.id);

        // ثالثاً: نحدث القائمة - هذا يؤثر على المستخدم الحالي فقط
        await supabase
            .from('courses')
            .update({'users_course': currentUsers}).eq('id', courseId);

        return ResponseService(true, "تم الشراء بنجاح!");
      } else {
        return ResponseService(true, "لقد قمت بشراء هذا الكورس مسبقاً");
      }
    } catch (e) {
      log('خطأ أثناء الشراء: $e');
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

//:get Completed Course

  Future<ResponseService<List<Course>>> getCompletedCourse() async {
    try {
      final String? userId = getIt<CacheHelper>().getData(key: Keys.userId);
      if (userId == null) return ResponseService(false, 'No user ID found', []);

      final List<dynamic> responses = await supabase
          .from('courses')
          .select()
          .contains('users_course', [userId]);

      final coursesList = (responses).isNotEmpty
          ? (responses).map((course) => Course.fromMap(course)).toList()
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

  //chat mentor

  Future<ResponseService<bool>> canChatWithMentor(int mentorId) async {
    try {
      final String? userId = getIt<CacheHelper>().getData(key: Keys.userId);
      if (userId == null)
        return ResponseService(false, 'No user ID found', false);
      // تحقق من وجود كورسات مجانية للمدرس
      final freeCourses = await supabase
          .from('courses')
          .select()
          .eq('mentor_id', mentorId)
          .single();
      // .contains('users_course', [userId]);

      List<dynamic> currentUsers = freeCourses['users_course'] ?? [];
      currentUsers.contains(userId);

      if (!currentUsers.contains(userId)) {
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

  // implement function get user from supabase
  Future<ResponseService<User?>> getUser() async {
    try {
      final user = supabase.auth.currentUser;

      if (user != null) {
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
              false, 'Failed to upload image: ${uploadResult.messege}', null);
        }
      }

      final user = supabase.auth.currentUser;
      if (user == null) {
        return ResponseService(false, 'User not found', null);
      }

      // استخدام الصورة الجديدة إذا تم تحميلها، أو الاحتفاظ بالصورة القديمة
      final imageUrlToSave = uploadedImageUrl ?? profileModel.imagePath;

      final updateAttributes = UserAttributes(
        data: profileModel.data?.toJson(imageUrlToSave),
      );

      var result = await supabase.auth.updateUser(updateAttributes);

      return ResponseService(true, 'User updated successfully', result.user);
    } catch (e) {
      log('Error in updateUserAndImageProfile: ${e.toString()}');
      return ResponseService(
          false, ErrorHandlerSupabase.getErrorMessage(e), null);
    }
  }

  Future<ResponseService<String?>> updateImageProfile(
      File? file, String? path) async {
    try {
      if (file != null && path == null) {
        // استخراج امتداد الملف بشكل صحيح
        String fileExtension = file.path.split('.').last;
        String fileName =
            '${DateTime.now().millisecondsSinceEpoch}.$fileExtension';

        await supabase.storage.from('profile').upload(fileName, file);
        String urlImage =
            supabase.storage.from('profile').getPublicUrl(fileName);

        return ResponseService(true, 'Success uploading image', urlImage);
      } else if (file != null && path != null) {
        String fileExtension = file.path.split('.').last;

        // استخراج مسار الملف من URL بشكل موثوق
        final uri = Uri.parse(path);
        // المسار الكامل داخل bucket بدون معالجة إضافية
        var fullPath = uri.path.split('/').last;

        // 🟢 رفع جديد + حذف القديم

        String newFileName =
            '${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
        await supabase.storage.from('profile').upload(newFileName, file);

        // حذف الصورة القديمة
        await supabase.storage.from('profile').remove([fullPath]);

        String urlImage =
            supabase.storage.from('profile').getPublicUrl(newFileName);

        return ResponseService(true, 'Success uploading new image', urlImage);
      } else {
        return ResponseService(false, 'No image provided', null);
      }
    } catch (e) {
      log('Error in updateImageProfile: ${e.toString()}');
      return ResponseService(
          false, ErrorHandlerSupabase.getErrorMessage(e), null);
    }
  }
}
