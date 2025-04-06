import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/home/cubit/home_cubit.dart';
// import 'package:education/future/home/data/model/response_home/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';
import '../../../widget/app_text_form_field.dart';
import '../data/model/categories_model.dart';

class CategoreisScrean extends StatelessWidget {
  const CategoreisScrean({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PaymentView(
            //       onPaymentSuccess: () {
            //         log('Sucesssss');
            //       },
            //       onPaymentError: () {
            //         log('failer');
            //       },
            //       price: 100, // Required: Total price (e.g., 100 for 100 EGP)
            //     ),
            //   ),
            // );
            context.pop();
          },
        ),
        title: Text("All Category", style: context.textStyle.bodyLarge),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 13),
            child: AppTextFormField(
              hintText: context.translate(LangKeys.search),
              validator: (p0) {},
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: SvgPicture.asset(
                  Assets.imagesSearchBlue,
                  height: 50,
                ),
              ),
            ),
          ),
          BlocProvider.value(
              value: data['cubit'] as HomeCubit,
              child: Column(
                children: List.generate(
                  (categoriesCourse.length / 2).ceil(),
                  (index) {
                    int firstIndex = index * 2;
                    int secondIndex = firstIndex + 1;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 27),
                      child: Row(
                        children: [
                          Expanded(
                            child: ImageCategories(
                              title: data['categories'][firstIndex].name!,
                              index: firstIndex,
                              image: categoriesCourse[firstIndex],
                            ),
                          ),
                          if (secondIndex <
                              categoriesCourse
                                  .length) // Check to avoid overflow
                            Expanded(
                              child: ImageCategories(
                                title:
                                    data['categories'][secondIndex].name ?? '',
                                index: secondIndex,
                                image: categoriesCourse[secondIndex],
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ))
        ],
      )),
    );
  }
}

class ImageCategories extends StatelessWidget {
  const ImageCategories(
      {super.key,
      required this.image,
      required this.index,
      required this.title});
  final String image;
  final String title;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          context
              .read<HomeCubit>()
              .emitgetfilltergategoriescourse(title, index);
          context.pushName(StringRoute.poluparScrean, arguments: {
            'index': index,
            'cubit': context.read<HomeCubit>(),
          });

          // context.pushName(StringRoute.poluparScrean, arguments: index);
        },
        child: SvgPicture.asset(
          image,
        ),
      ),
    );
  }
}
