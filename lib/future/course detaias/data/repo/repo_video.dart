import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:education/core/service/video_hundle/video_service.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

// class RepoVideo {
//   final VideoService _services;

//   RepoVideo(this._services);

//   Future<Either<Failure, (String, String?)>> play(String url, String fileName,
//       Function(int, int)? onReceiveProgress) async {
//     try {
//       var path = await _services.hundleReqestVideoOrPdf(
//           url, fileName, onReceiveProgress);
//       return right(path);
//     } on CustomException catch (e) {
//       log(e.message);
//       return left(ServerFailure(e.message));
//     }
//   }
// }

class RepoVideo {
  final VideoService _services;

  RepoVideo(this._services);

  /// تشغيل الفيديو أو عرض ملف PDF
  Future<Either<Failure, (String?, String?)>> play(String url, String fileName,
      Function(int, int)? onReceiveProgress) async {
    try {
      // استدعاء الخدمة لمعالجة الملف
      final path = await _services.handleRequestVideoOrPdf(
          url, fileName, onReceiveProgress);
      if (path.$1 == null) {
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
}
