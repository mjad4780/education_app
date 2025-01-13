import 'dart:developer';

import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';
import '../../../widget/app_text_form_field.dart';
import '../../paymop/views/payment_view.dart';
import '../data/model/categories_model.dart';

class CategoreisScrean extends StatelessWidget {
  const CategoreisScrean({super.key});

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentView(
                  onPaymentSuccess: () {
                    log('Sucesssss');
                  },
                  onPaymentError: () {
                    log('failer');
                  },
                  price: 100, // Required: Total price (e.g., 100 for 100 EGP)
                ),
              ),
            );
            // context.pop();
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
          Column(
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
                          index: firstIndex,
                          image: categoriesCourse[firstIndex],
                        ),
                      ),
                      if (secondIndex <
                          categoriesCourse.length) // Check to avoid overflow
                        Expanded(
                          child: ImageCategories(
                            index: secondIndex,
                            image: categoriesCourse[secondIndex],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}

class ImageCategories extends StatelessWidget {
  const ImageCategories({super.key, required this.image, required this.index});
  final String image;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          context.pushName(StringRoute.poluparScrean, arguments: index);
        },
        child: SvgPicture.asset(
          image,
        ),
      ),
    );
  }
}
