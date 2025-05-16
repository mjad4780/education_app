import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/failer_widget.dart';
import 'package:education/future/chats/cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Router/route_string.dart';
import '../../../core/helpers/spacing.dart';

class CardChats extends StatelessWidget {
  const CardChats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatsCubit>()..getMentorsWithFreeCourses(),
      child: Container(
        height: height(context) / 1.5,
        width: width(context) * 0.82,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<ChatsCubit, ChatsState>(
            buildWhen: (previous, current) =>
                current is ChatsLoading ||
                current is ChatsError ||
                current is MentorsLoaded,
            builder: (context, state) {
              if (state is ChatsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ChatsError) {
                return FailerWidget(
                  untext: false,
                  messege: state.message,
                  onPressed: () =>
                      context.read<ChatsCubit>()..getMentorsWithFreeCourses(),
                );
                // return Center(child: Text( state.message));
              } else if (state is MentorsLoaded) {
                return ListView.builder(
                  itemCount: state.mentors.length,
                  itemBuilder: (context, index) {
                    final mentor = state.mentors[index];

                    return GestureDetector(
                      onTap: () {
                        context.pushName(StringRoute.screenChatsDetalias,
                            arguments: {
                              'id': state.mentors[index].id.toString(),
                              'cubit': context.read<ChatsCubit>()
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                        AssetImage(mentor.profileImage!)),
                                horizontalSpace(3),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(mentor.name ?? 'Unknown',
                                        style: context.textStyle.headlineSmall!
                                            .copyWith(
                                                color:
                                                    context.color.primaryColor,
                                                fontWeight: FontWeight.w600)),
                                    Text(mentor.title ?? 'No specialization',
                                        style: context.textStyle.displaySmall!
                                            .copyWith(
                                                color: context.color.greyDark,
                                                fontWeight: FontWeight.w700)),
                                  ],
                                ),
                                const Spacer(),
                                // Column(
                                //   children: [
                                //     Container(
                                //       width: 30,
                                //       height: 30,
                                //       clipBehavior: Clip.antiAlias,
                                //       decoration: ShapeDecoration(
                                //         color: context.color.blue,
                                //         shape: const OvalBorder(
                                //           side: BorderSide(
                                //             width: 2,
                                //             color: Color(0xFFE8F1FF)
                                //           ),
                                //         ),
                                //       ),
                                //       child: Center(
                                //         child: Text(
                                //           '${mentor.unreadMessages ?? 0}',
                                //           textAlign: TextAlign.center,
                                //           style: context.textStyle.titleSmall!.copyWith(
                                //             color: context.color.white,
                                //             fontWeight: FontWeight.w600,
                                //           ),
                                //         ),
                                //       ),
                                //     ),

                                //   ],
                                // )
                              ],
                            ),
                            const Divider(color: Color(0xffE8F1FF))
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
