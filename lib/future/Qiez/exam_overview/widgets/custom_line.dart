import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      width: double.infinity,
      color: Colors.grey.withOpacity(0.4),
    );
  }
}
