import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:education/key.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationService {
  final Dio dio;

  NotificationService(this.dio);

  String gettoken() {
    return OneSignal.User.pushSubscription.id!;
  }

  Future<void> sendOneSignalNotification(BodySendNotification body) async {
    const String apiUrl = 'https://onesignal.com/api/v1/notifications';
    const String apiKey = apikeyoneSignal;
    const String appId = onesignalId;
    final Map<String, dynamic> requestBody = {
      "included_segments": ["education"], // Topic
      // "include_player_ids": [body.playerId,
      //   "e8d196dd-36db-49e7-9574-6db09172b219",
      // ], // Token (يمكنك استخدامه بدلاً من included_segments)
      "headings": {"en": body.title}, // Title
      "contents": {"en": body.body}, // Body
      "ios_interruption_level": "critical", // إشعار مهم (لـ iOS)
      "app_id": appId, // App ID
      "large_icon": "ic_launcher_round.png", // أيقونة كبيرة
      "data": {
        "foo": "Additional data which you want to send with your notification"
      }, // بيانات إضافية
      "big_picture": body.image, // صورة كبيرة
    };

    final Map<String, String> headers = {
      'Authorization': 'Basic $apiKey',
      'accept': 'application/json',
      'content-type': 'application/json',
    };

    try {
      final Response response = await dio.post(
        apiUrl,
        data: requestBody,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        log("تم إرسال الإشعار بنجاح!");
      } else {
        log("فشل إرسال الإشعار: ${response.data}");
      }
    } catch (error) {
      log('حدث خطأ أثناء إرسال الإشعار: $error');
    }
  }
}

class BodySendNotification {
  final String title;
  final String body;
  final String image;
  final String? playerId;

  BodySendNotification(this.title, this.body, this.image, this.playerId);
}
