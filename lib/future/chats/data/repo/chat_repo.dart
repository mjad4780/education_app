import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:education/core/error/exceptions.dart';
import 'package:education/core/error/failures.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/connectivity_controller.dart';
import 'package:education/core/service/supabase/chat/chat_service.dart';
import 'package:education/future/chats/data/model/message_model.dart';
import 'package:education/future/home/data/model/response_home/mentor.dart';

class ChatRepo {
  final SupabaseChatService _chatService;
  ChatRepo(
    this._chatService,
  );

  Future<Either<Failure, List<Mentor>>> getMentorsWithFreeCourses() async {
    try {
      if (!getIt<ConnectivityController>().isConnected.value) {
        return left(ServerFailure('No internet connection'));
      }
      var response = await _chatService.getMentorsWithFreeCourses();
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

  Future<Either<Failure, void>> sendMessage(
    String receiverId,
    String content,
    bool senderType,
  ) async {
    try {
      if (!getIt<ConnectivityController>().isConnected.value) {
        return left(ServerFailure('No internet connection'));
      }
      var response = await _chatService.sendMessage(
        receiverId,
        content,
        senderType,
      );
      if (response.result) {
        return right(null);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      log(e.message);
      return left(ServerFailure(e.message));
    }
  }

  //  gert streem memmagwe
  Future<Either<Failure, Stream<List<Message>>>> messagesStream(
      String otherUserId) async {
    try {
      if (!getIt<ConnectivityController>().isConnected.value) {
        return left(ServerFailure('No internet connection'));
      }
      var response = _chatService.messagesStream(otherUserId);
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
