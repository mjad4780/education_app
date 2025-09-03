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
  Future<ResponseService> checkPermissionStorage() async {
    try {
      if (await Permission.storage.isRestricted) {
        return ResponseService(false, "Permission restricted by policy");
      }

      PermissionStatus status = await Permission.storage.status;

      if (status.isGranted) {
        return ResponseService(true, "Already granted");
      } else if (status.isDenied) {
        status = await Permission.storage.request();

        if (status.isGranted) {
          return ResponseService(true, "Granted after request");
        } else if (status.isPermanentlyDenied) {
          await openAppSettings();
          return ResponseService(false, "Open settings to enable");
        } else {
          return ResponseService(false, "Permission denied");
        }
      }

      return ResponseService(false, "Unexpected status");
    } catch (e) {
      log("Permission error: $e");
      return ResponseService(false, "Error: ${e.toString()}");
    }
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
  Future<(String?, String?, bool?)> handleRequestVideoOrPdf(String url,
      String fileName, Function(int, int)? onReceiveProgress) async {
    try {
      ResponseService permissionResult = await checkPermissionStorage();
      if (!permissionResult.result) {
        return ('permission_error', permissionResult.messege, false);
      }

      String? filePath = await checkLocalFile(fileName);
      filePath ??= await downloadFile(url, fileName, onReceiveProgress)
          .then((value) => value.result ? value.messege : null);
      if (filePath == null) {
        return (null, "Failed to download file", false);
      }

      return (fileTypes(url), filePath, true);
    } catch (e) {
      log("Error handling request: ${e.toString()}");
      return ('error', "Unexpected error occurred", false);
    }
  }
}
