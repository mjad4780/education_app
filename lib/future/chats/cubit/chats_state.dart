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
