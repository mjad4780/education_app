import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble(
      {super.key, required this.isCurrentUser, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 50,
        ),
        decoration: BoxDecoration(
            color: isCurrentUser ? Colors.teal : context.color.lightBlue,
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(11),
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(message,
                  style: context.textStyle.titleLarge!.copyWith(
                    color: isCurrentUser ? Colors.white : Colors.black,
                  )),
              Text('12:45',
                  textAlign: TextAlign.end,
                  style: context.textStyle.displayLarge!.copyWith(
                    color: isCurrentUser ? Colors.white : Colors.black,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
