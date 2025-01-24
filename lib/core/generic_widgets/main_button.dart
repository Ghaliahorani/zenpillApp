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
      onPressed: isEnabled ? onPressed : null,
      // تعطيل الزر إذا لم يكن مفعلاً
      color: fillColor,
      height: 48.h,
      minWidth: 328.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 0,
      child: Text(
        textButton,
        style: textStyleButton.copyWith(
          color: isEnabled
              ? textStyleButton.color
              : textStyleButton.color
                  ?.withOpacity(0.5), // تخفيف لون النص إذا كان معطلاً
        ),
      ),
    );
  }
}
