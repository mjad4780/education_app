import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) => SizedBox(
      height: height.h,
    );

SizedBox horizontalSpace(double width) => SizedBox(
      width: width.w,
    );
double width(context) => MediaQuery.sizeOf(context).width;
double height(context) => MediaQuery.sizeOf(context).height;
