class ChatSummary {
  final Map<String, dynamic> user;
  final String lastMessage;
  final DateTime timestamp;
  final int unreadCount;

  ChatSummary({
    required this.user,
    required this.lastMessage,
    required this.timestamp,
    required this.unreadCount,
  });

  ChatSummary copyWith({
    int? unreadCount,
  }) {
    return ChatSummary(
      user: user,
      lastMessage: lastMessage,
      timestamp: timestamp,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }
}
