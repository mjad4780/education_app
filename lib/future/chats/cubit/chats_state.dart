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

final class MessagesLoading extends ChatsState {}

final class MessagesUpdated extends ChatsState {
  final List<Message> messages;
  MessagesUpdated(this.messages);
}
