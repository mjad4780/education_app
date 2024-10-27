import 'dart:io';

import 'package:flutter/material.dart';

void testAlert(BuildContext context, String title, String body) {
  var alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    title: Text(title),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(body),
        ],
      ),
    ),
    actions: <Widget>[
      TextButton(
        child: const Text(
          'cancel',
        ),
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      ),
      TextButton(
        child: const Text(
          'Approve',
        ),
        onPressed: () {
          Navigator.of(context).pop(true);

          exit(0);
        },
      ),
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
