import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class MainButton extends StatelessWidget {
  final Color fillColor;
  final String textButton;
  final TextStyle textStyleButton;
  final VoidCallback? onPressed;
  final isEnabled;

  MainButton(
      {this.fillColor = AppColors.primaryColor,
      required this.textButton,
      required this.textStyleButton,
      required this.onPressed,
      this.isEnabled = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: isEnabled ? fillColor : AppColors.cardBackground,

      onPressed: onPressed,
      // تعطيل الزر إذا لم يكن مفعلاً
      color: fillColor,
      height: 48.h,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.r),
      ),
      elevation: 0,
      child: Text(textButton, style: textStyleButton),
    );
  }
}
