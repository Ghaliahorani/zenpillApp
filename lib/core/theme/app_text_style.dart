import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';

class AppTextStyle {
  static TextStyle f16W400Black = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: AppColors.fontColor16);
  static TextStyle f16W400Primary = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: AppColors.primaryColor);

  static const TextStyle f24W700White = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: AppColors.cardBackgroundColor);
  static TextStyle f24W500White = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24.sp,
      color: AppColors.cardBackgroundColor);
}
