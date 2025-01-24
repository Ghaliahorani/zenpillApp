import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class MainButton extends StatelessWidget {
  final Color fillColor;
  final String textButton;
  final TextStyle textStyleButton;
  final Function onPressed;

  MainButton({
    this.fillColor = AppColors.primaryColor,
    required this.textButton,
    required this.textStyleButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      color: fillColor,
      height: 48.h,
      minWidth: 328.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 0,
      child: Text(
        textButton,
        style: textStyleButton,
      ),
    );
  }
}
