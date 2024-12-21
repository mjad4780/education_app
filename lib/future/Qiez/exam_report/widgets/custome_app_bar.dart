import 'package:flutter/material.dart';

import '../../constants.dart';

PreferredSizeWidget appBarCustom({
  required String pageName,
  required BuildContext context,
}) =>
    AppBar(
      // backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 6,
          horizontal: 9,
        ),
        child: CircleAvatar(
          backgroundColor: iconBackgroundColor,
          // radius: 14,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
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
