import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';

class CustomGesturedetector extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final double paddingVertical;
  final double paddingHorizontal;

  // final Color selectedColor;
  // final Color unselectedColor;
  final double borderRadius;

  CustomGesturedetector({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.paddingVertical = 9.0,
    this.paddingHorizontal = 16.0,
    // this.selectedColor = Colors.blue,
    // this.unselectedColor = Colors.grey,
    this.borderRadius = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical.h,
          horizontal: paddingHorizontal.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          border: Border.all(
            color:
                isSelected ? AppColors.primaryColor : AppColors.neutral50Color,
          ),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 16.sp), // حجم النص
        ),
      ),
    );
  }
}
