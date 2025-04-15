import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(child: Skeleton.shade(shade: true, child: child));
  }
}
