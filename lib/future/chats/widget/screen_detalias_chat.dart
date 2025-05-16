import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/chats/cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';
import '../../../widget/app_text_form_field.dart';
import 'chat_bubble.dart';

class ScreenChatsDetalias extends StatefulWidget {
  const ScreenChatsDetalias({super.key, required this.argument});
  final Map<String, dynamic> argument;
  @override
  State<ScreenChatsDetalias> createState() => _ScreenChatsDetaliasState();
}

TextEditingController message = TextEditingController();

class _ScreenChatsDetaliasState extends State<ScreenChatsDetalias> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ChatsCubit>().startMessagesStream(widget.argument['id']);
  }

  @override
  void dispose() {
    message.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.argument['cubit'] as ChatsCubit,
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
              actions: [
                SvgPicture.asset(Assets.phoneBlack),
                horizontalSpace(20),
                SvgPicture.asset(Assets.imagesSearchGray),
                horizontalSpace(16)
              ],
              title: Text(context.translate(LangKeys.inbox),
                  style: context.textStyle.bodyLarge),
            ),
            body: Column(
              children: [
                BlocConsumer<ChatsCubit, ChatsState>(
                  buildWhen: (previous, current) =>
                      current is ChatsLoading ||
                      current is ChatsError ||
                      current is MessagesUpdated,
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is MessagesUpdated) {
                      return SingleChildScrollView(
                        child: Column(
                            children: List.generate(
                          state.messages.length,
                          (i) => ChatBubble(
                            isCurrentUser: state.messages[i].senderType,
                            message: state.messages[i].content,
                          ),
                        )),
                      );
                    } else if (state is ChatsLoading) {
                      return Column(
                          children: List.generate(
                        5,
                        (i) => ChatBubble(
                          isCurrentUser: i % 2 != 0 ? true : false,
                          message: '',
                        ),
                      ));
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 13),
                  child: AppTextFormField(
                      controller: message,
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
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: InkWell(
                          onTap: () {
                            context.read<ChatsCubit>().sendMessage(
                                widget.argument['id'], message.text, true);
                          },
                          child: CircleAvatar(
                              radius: 21,
                              backgroundColor: context.color.blue,
                              child: const Icon(Icons.send_rounded)),
                        ),
                      )),
                )
              ],
            ));
      }),
    );
  }
}
