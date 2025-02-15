import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';

import '../../success/return_response_service.dart';

class VideoService {
  final Dio dio;

  VideoService(this.dio);

  // التحقق من أذونات التخزين
  Future<ResponseService?> checkPermissionStorage() async {
    try {
      if (!await Permission.storage.request().isGranted) {
        return ResponseService(false, "Storage permission not granted");
      }
    } catch (e) {
      log("Error checking permissions: ${e.toString()}");
      return ResponseService(false, "Error checking permissions");
    }
    return null;
  }

  // التحقق إذا كان الملف موجودًا محليًا
  Future<String?> checkLocalFile(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';

      if (File(filePath).existsSync()) {
        // File(filePath).delete();
        log('File already exists locally at: $filePath');
        return filePath;
      }
    } catch (e) {
      log("Error checking local file: ${e.toString()}");
    }
    return null;
  }

  // تنزيل الملف وحفظه
  Future<ResponseService> downloadFile(String url, String fileName,
      Function(int, int)? onReceiveProgress) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';

      // حذف الملف إذا كان موجودًا مسبقًا
      final file = File(filePath);
      if (file.existsSync()) {
        file.deleteSync();
        log('Existing file deleted at: $filePath');
      }

      await dio.download(url, filePath, onReceiveProgress: onReceiveProgress);
      log('Download completed. File saved at: $filePath');
      return ResponseService(true, filePath);
    } catch (e) {
      log("Download failed: ${e.toString()}");
      return ResponseService(false, "Failed to download file");
    }
  }

  // تحديد نوع الملف بناءً على الامتداد
  String fileTypes(String url) {
    try {
      final extension = p.extension(url).toLowerCase();

      if (extension == '.mp4') {
        return 'video';
      } else if (extension == '.pdf') {
        return 'pdf';
      } else {
        return 'unsupported $extension';
      }
    } catch (e) {
      log("Error determining file type: ${e.toString()}");
      return 'unknown';
    }
  }

  // فتح الملف أو تحميله إذا لم يكن موجودًا
  Future<(String?, String?)> handleRequestVideoOrPdf(String url,
      String fileName, Function(int, int)? onReceiveProgress) async {
    try {
      final permissionResult = await checkPermissionStorage();
      if (permissionResult != null && !permissionResult.result) {
        return ('permission_error', permissionResult.messege);
      }

      String? filePath = await checkLocalFile(fileName);
      filePath ??= await downloadFile(url, fileName, onReceiveProgress)
          .then((value) => value.result ? value.messege : null);
      if (filePath == null) {
        return (null, "Failed to download file");
      }

      return (fileTypes(url), filePath);
    } catch (e) {
      log("Error handling request: ${e.toString()}");
      return ('error', "Unexpected error occurred");
    }
  }
}
