import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';
import '../../../widget/app_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
            context.pop();
          },
        ),
        title: Text(context.translate(LangKeys.search),
            style: context.textStyle.bodyLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 13),
              child: AppTextFormField(
                hintText: context.translate(LangKeys.search),
                validator: (p0) {},
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: SvgPicture.asset(
                    Assets.imagesSearchBlue,
                    height: 45,
                  ),
                ),
              ),
            ),
            Column(
                children: List.generate(
                    11,
                    (index) => const Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Row(
                            children: [
                              Text(
                                '3D Design',
                                style: TextStyle(
                                  color: Color(0xFFA0A4AB),
                                  fontSize: 15,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.close)
                            ],
                          ),
                        )))
          ],
        ),
      ),
    );
  }
}
