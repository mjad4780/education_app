import 'package:flutter/material.dart';

snacPar(BuildContext context, String text, String s) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
