import 'dart:async';
import 'dart:developer';

import 'package:education/core/error/error_handler_supabase.dart';
import 'package:education/core/success/return_response_service.dart';
import 'package:education/future/chats/data/model/message_model.dart';
import 'package:education/future/home/data/model/response_home/mentor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseChatService {
  final SupabaseClient _supabase;

  SupabaseChatService(this._supabase);

  //region Message Operations
  Future<ResponseService<void>> sendMessage(
    String receiverId,
    String content,
    bool senderType,
  ) async {
    String currentUserId = _supabase.auth.currentUser!.id;
    try {
      final response = await _supabase.from('messages').insert({
        'sender_id': currentUserId,
        'receiver_id': receiverId,
        'content': content,
        'is_read': false,
        'sender_type': senderType,
      }).select();
      // sender_type==true ?student: mentor
      if (response.isEmpty) {
        return ResponseService(false, 'no messsage');
      } else {
        return ResponseService(true, 'success');
      }
    } catch (e) {
      log("Error sending message: ${e.toString()}");
      return ResponseService(false, ErrorHandlerSupabase.getErrorMessage(e));
    }
  }

  Stream<List<Message>> messagesStream(String otherUserId) {
    final String userId = _supabase.auth.currentUser!.id;
    log('userid: $userId');
    log('userid: $otherUserId');

    try {
      return _supabase
          .from('messages')
          .stream(primaryKey: ['id'])
          .inFilter(
            'sender_id',
            [userId, otherUserId],
          )
          .order('created_at', ascending: true)
          .map((data) {
            log('Messages from me to other: $data');
            return data.map((json) => Message.fromJson(json, userId)).toList();
          });
    } catch (e) {
      log('Error creating stream: $e');
      final controller = StreamController<List<Message>>();
      controller.addError(e);
      return controller.stream;
    }
  }

  Future<ResponseService<List<Mentor>>> getMentorsWithFreeCourses() async {
    try {
      // 1. جلب الكورسات المجانية
      final freeCourses = await _supabase
          .from('courses')
          .select('mentor_id')
          .eq('is_free', true);

      // 2. استخراج معرفات المدرسين الفريدة
      final mentorIds = freeCourses
          .map((c) => c['mentor_id'] as int?)
          .whereType<int>()
          .toSet()
          .toList();

      if (mentorIds.isEmpty) {
        return ResponseService(false, 'لا يوجد مدرسين بكورسات مجانية', []);
      }
      final mentorsData = await _supabase
          .from('mentors')
          .select()
          .filter('id', 'in', '(${mentorIds.join(',')})');

      final mentors =
          mentorsData.map((mentor) => Mentor.fromMap(mentor)).toList();

      return ResponseService(true, 'تم جلب البيانات بنجاح', mentors);
    } catch (e) {
      log(e.toString());
      log("runtimeType${e.runtimeType}");
      return ResponseService(false, ErrorHandlerSupabase.getErrorMessage(e));
    }
  }
}
