import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

PreferredSizeWidget appBarCustom({
  required String pageName,
  required BuildContext context,
}) =>
    AppBar(
      backgroundColor: context.color.greyLight,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundColor: iconBackgroundColor,
          radius: 3,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
            color: mainColor,
          ),
        ),
      ),
      title: Text(
        pageName,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    );
