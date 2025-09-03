import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:education/future/chats/data/model/message_model.dart';
import 'package:education/future/chats/data/repo/chat_repo.dart';
import 'package:education/future/home/data/model/response_home/mentor.dart';
import 'package:meta/meta.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this._chatRepo) : super(ChatsInitial());
  final ChatRepo _chatRepo;

  Future<void> getMentorsWithFreeCourses() async {
    emit(ChatsLoading());
    final result = await _chatRepo.getMentorsWithFreeCourses();
    result.fold(
      (failure) => emit(ChatsError(failure.message)),
      (mentors) => emit(MentorsLoaded(mentors)),
    );
  }

  Future<void> sendMessage(
    String receiverId,
    String content,
    bool senderType,
  ) async {
    if (content.trim().isEmpty) return;

    final result = await _chatRepo.sendMessage(receiverId, content, senderType);
    result.fold(
      (failure) => emit(MessageSentError(failure.message)),
      (_) {
        log('Message sent successfully');
      },
    );
  }

  // Simple method to get messages stream
  // Future getMessagesStream(String otherUserId) async {
  //   emit(MessagesStreamLoading());
  //   final result = await _chatRepo.messagesStream(otherUserId);
  //   return result.fold(
  //     (failure) {
  //       emit(MessagesStreamError(failure.message));
  //     },
  //     (stream) => emit(MessagesUpdated(stream)),
  //   );
  // }
}
