import 'dart:developer';

import 'package:dartz/dartz.dart';
// import 'package:education/core/service/home_service/supabase_services_Home.dart';
import 'package:education/core/service/video_hundle/video_service.dart';
import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';
import 'package:education/core/service/supabase/home_service/supabase_services_home.dart';

import 'package:education/core/error/exceptions.dart';
import 'package:education/core/error/failures.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/connectivity_controller.dart';

class RepoVideo {
  final VideoService _services;
  final SupabaseServiceHome _supabase;

  RepoVideo(this._services, this._supabase);

  /// تشغيل الفيديو أو عرض ملف PDF
  Future<Either<Failure, (String?, String?, bool?)>> play(String url,
      String fileName, Function(int, int)? onReceiveProgress) async {
    try {
      // استدعاء الخدمة لمعالجة الملف
      final path = await _services.handleRequestVideoOrPdf(
          url, fileName, onReceiveProgress);
      if (path.$3 == false) {
        return Left(ServerFailure(path.$2!));
      } else {
        return Right(path);
      }
      // إرجاع النتيجة إذا كانت ناجحة
    } on CustomException catch (e) {
      // تسجيل الخطأ المخصص
      log("CustomException: ${e.message}");
      return Left(ServerFailure(e.message));
    } catch (e) {
      // تسجيل أي خطأ غير متوقع
      log("Unexpected error: ${e.toString()}");
      return Left(ServerFailure("An unexpected error occurred"));
    }
  }

  Future<Either<Failure, String>> updateCourseToFree(int courseId) async {
    try {
      if (!getIt<ConnectivityController>().isConnected.value) {
        return left(ServerFailure('No internet connection'));
      }
      var response = await _supabase.updateCourseTo(courseId);
      if (response.result) {
        return right(response.messege);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      log(e.message);
      return left(ServerFailure(e.message));
    }
  }

  Future<Either<Failure, DetailasCourse>> getCourseDetails(int courseId) async {
    try {
      if (!getIt<ConnectivityController>().isConnected.value) {
        return left(ServerFailure('No internet connection'));
      }
      var response = await _supabase.getCourseDetails(courseId);
      if (response.result) {
        return right(response.data!);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      log(e.message);
      return left(ServerFailure(e.message));
    }
  }
}
