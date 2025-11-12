class Message {
  final String id;
  final String senderId;
  final bool senderType; // 'student' أو 'mentor'
  final String receiverId;
  final String content;
  final String conversationId;

  final bool isRead;
  final DateTime createdAt;
  final bool isMe;

  Message({
    required this.id,
    required this.senderId,
    required this.senderType,
    required this.receiverId,
    required this.content,
    required this.conversationId,
    required this.isRead,
    required this.createdAt,
    required this.isMe,
  });

  factory Message.fromJson(Map<String, dynamic> json, String currentUserId) {
    return Message(
      id: json['id'] as String,
      senderId: json['sender_id'] as String,
      senderType: json['sender_type'] as bool,
      receiverId: json['receiver_id'] as String,
      content: json['content'] as String,
      isRead: json['is_read'] as bool,
      conversationId: json['conversation_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isMe: json['sender_id'] == currentUserId,
    );
  }
}
