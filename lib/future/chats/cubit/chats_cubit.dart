import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:education/future/chats/data/model/message_model.dart';
import 'package:education/future/chats/data/repo/chat_repo.dart';
import 'package:education/future/home/data/model/response_home/mentor.dart';
import 'package:meta/meta.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this._chatRepo) : super(ChatsInitial());
  final ChatRepo _chatRepo;
  StreamSubscription<List<Message>>? _messagesSubscription;
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
    emit(ChatsLoading());
    final result = await _chatRepo.sendMessage(receiverId, content, senderType);
    result.fold(
      (failure) => emit(ChatsError(failure.message)),
      (_) => emit(MessageSentSuccess()),
    );
  }

  Future<void> startMessagesStream(String otherUserId) async {
    // emit(MessagesLoading());
    final result = await _chatRepo.messagesStream(otherUserId);
    result.fold(
      (failure) => emit(ChatsError(failure.message)),
      (stream) {
        _messagesSubscription?.cancel();
        _messagesSubscription = stream.listen(
          (messages) => emit(MessagesUpdated(messages)),
          onError: (error) => emit(ChatsError(error.toString())),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
