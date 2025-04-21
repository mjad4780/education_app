import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:education/core/service/home_service/supabase_services_Home.dart';
import 'package:education/core/service/video_hundle/video_service.dart';
import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

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

  Future<Either<Failure, DetailasCourse>> getCourseDetails(int courseId) async {
    try {
      var response = await _supabase.getCourseDetails(courseId);
      return right(response);
    } on CustomException catch (e) {
      log(e.message);
      return left(ServerFailure(e.message));
    }
  }
}
