import 'dart:developer';

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
    } on PostgrestException catch (e) {
      throw ResponseService(false, 'Failed to send message: ${e.message}');
    } catch (e) {
      throw ResponseService(false, 'Unexpected error: ${e.toString()}');
    }
  }

  ResponseService<Stream<List<Message>>> messagesStream(String otherUserId) {
    final String userId = _supabase.auth.currentUser!.id;

    // أولاً: نجلب كل الرسائل التي يكون فيها المستخدمون طرفي المحادثة
    final userPair = [
      [userId, otherUserId],
      [otherUserId, userId]
    ];

    try {
      final response = _supabase
          .from('messages')
          .stream(primaryKey: ['id'])
          .inFilter('sender_id,receiver_id', userPair)
          .order('created_at', ascending: false)
          .map((data) {
            return data.map((json) => Message.fromJson(json, userId)).toList();
          });
      return ResponseService(true, '', response);
    } on PostgrestException catch (e) {
      log('خطأ في قاعدة البيانات: ${e.message}');
      return ResponseService(false, 'فشل في جلب البيانات من الخادم');
    } on Exception catch (e) {
      log('خطأ غير متوقع: $e');
      return ResponseService(false, 'حدث خطأ غير متوقع');
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

      // 3. جلب بيانات المدرسين باستخدام filter + in
      final mentorsData = await _supabase
          .from('mentors')
          .select()
          .filter('id', 'in', '(${mentorIds.join(',')})');

      final mentors =
          mentorsData.map((mentor) => Mentor.fromMap(mentor)).toList();

      return ResponseService(true, 'تم جلب البيانات بنجاح', mentors);
    } on PostgrestException catch (e) {
      log('خطأ في قاعدة البيانات: ${e.message}');
      return ResponseService(false, 'فشل في جلب البيانات من الخادم');
    } on Exception catch (e) {
      log('خطأ غير متوقع: $e');
      return ResponseService(false, 'حدث خطأ غير متوقع');
    }
  }
}
