part of 'chats_cubit.dart';

@immutable
sealed class ChatsState {}

final class ChatsInitial extends ChatsState {}

final class HomeCallIDErrorState extends ChatsState {
  final String messege;

  HomeCallIDErrorState(this.messege);
}

final class HomeCallIDSuccessState extends ChatsState {
  final String userName;
  final String callId;

  HomeCallIDSuccessState(this.userName, this.callId);
}

final class ChatsLoading extends ChatsState {}

final class ChatsError extends ChatsState {
  final String message;
  ChatsError(this.message);
}

final class MentorsLoaded extends ChatsState {
  final List<Mentor> mentors;
  MentorsLoaded(this.mentors);
}

final class MessageSentSuccess extends ChatsState {}

final class MessageSentError extends ChatsState {
  final String message;
  MessageSentError(this.message);
}

final class MessageSendLoading extends ChatsState {}

//stream of messages
final class MessagesStreamLoading extends ChatsState {}

final class MessagesStreamError extends ChatsState {
  final String message;
  MessagesStreamError(this.message);
}

final class MessagesUpdated extends ChatsState {
  final Stream<List<Message>> messages;
  MessagesUpdated(this.messages);
}
