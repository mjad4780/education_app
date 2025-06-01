import 'dart:developer';

import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/service/supabase/chat/chat_service.dart';

import 'package:education/future/chats/cubit/chats_cubit.dart';
import 'package:education/future/chats/data/model/message_model.dart';
import 'package:education/utility/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';
import '../../../widget/app_text_form_field.dart';
import 'chat_bubble.dart';

class ScreenChatsDetails extends StatefulWidget {
  const ScreenChatsDetails({super.key, required this.argument});
  final Map<String, dynamic> argument;

  @override
  State<ScreenChatsDetails> createState() => _ScreenChatsDetailsState();
}

class _ScreenChatsDetailsState extends State<ScreenChatsDetails> {
  late TextEditingController messageController;
  late ScrollController scrollController;
  late SupabaseChatService supabase;
  @override
  void initState() {
    super.initState();
    supabase = getIt<SupabaseChatService>();

    messageController = TextEditingController();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage(BuildContext context) {
    if (messageController.text.trim().isEmpty) return;

    final messageText = messageController.text.trim();
    messageController.clear();

    (widget.argument['cubit'] as ChatsCubit).sendMessage(
      widget.argument['id'],
      messageText,
      true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.argument['cubit'] as ChatsCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => context.pop(),
          ),
          actions: [
            SvgPicture.asset(Assets.phoneBlack),
            horizontalSpace(20),
            SvgPicture.asset(Assets.imagesSearchGray),
            horizontalSpace(16)
          ],
          title: Text(
            context.translate(LangKeys.inbox),
            style: context.textStyle.bodyLarge,
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: StreamBuilder<List<Message>>(
              stream: supabase.messagesStream(widget.argument['id']),
              builder: (context, snapshot) {
                log('mmmmmmmmmmmmmmmmmm');
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: 5,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      return LoadingWidget(
                        child: ChatBubble(
                          dateTime: DateTime.now(),
                          isCurrentUser:
                              index % 2 == 0, // Will be overridden below
                          message: '',
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline, size: 48),
                        const SizedBox(height: 16),
                        Text('Error: ${snapshot.error}'),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No messages'));
                }
                final messages = snapshot.data!;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollToBottom();
                });
                return ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: messages.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ChatBubble(
                      dateTime: message.createdAt,
                      isCurrentUser: message.senderType,
                      message: message.content,
                    );
                  },
                );
              },
            )),

            // Message Input
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -1),
                    blurRadius: 4,
                    color: Colors.black.withAlpha((0.1 * 255).toInt()),
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        controller: messageController,
                        backgroundColor: context.color.lightBlue,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.color.lighterGray,
                            width: 1.3,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: context.translate(LangKeys.message),
                        validator: (p0) {},
                        // onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                        onTap: () => _sendMessage(context),
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: context.color.white,
                            shape: BoxShape.circle,
                          ),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircleAvatar(
                                radius: 21,
                                backgroundColor: context.color.blue,
                                child: Icon(
                                  Icons.send_rounded,
                                  color: context.color.white,
                                )),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
