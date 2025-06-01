import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/future/chats/cubit/chats_cubit.dart';
import 'package:education/future/main/widget/main_view_body.dart';
import 'package:education/utility/images_aseets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/helpers/spacing.dart';
import '../../core/language/lang_keys.dart';
import 'widget/card_chats.dart';
import 'widget/custom_buttom_chats.dart';
import 'widget/custom_widget_calls.dart';

class ScreanChats extends StatelessWidget {
  const ScreanChats({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 35.sp,
                ),
                onPressed: () {},
              ),
              Text(context.translate(LangKeys.inbox),
                  style: context.textStyle.bodyLarge),
              const Spacer(),
              SvgPicture.asset(Assets.imagesSearchGray),
              horizontalSpace(13)
            ],
          ),
          BlocProvider(
            create: (context) =>
                getIt<ChatsCubit>()..getMentorsWithFreeCourses(),
            child: const BodyChatsAndCalls(),
          )
        ],
      ),
    );
  }
}

class BodyChatsAndCalls extends StatefulWidget {
  const BodyChatsAndCalls({super.key});

  @override
  State<BodyChatsAndCalls> createState() => _BodyChatsAndCallsState();
}

ValueNotifier<bool> value = ValueNotifier(false);

class _BodyChatsAndCallsState extends State<BodyChatsAndCalls> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: value,
        builder: (context, fileExistsValue, child) {
          return Column(
            children: [
              verticalSpace(13),
              CustomButtomChats(
                valueNotifier: value,
              ),
              verticalSpace(13),
              fileExistsValue
                  ? const KeepAlivePage(child: CardChats())
                  : const CustomWidgetCalls()
              //    CustomWidgetCalls()
            ],
          );
        });
  }
}
