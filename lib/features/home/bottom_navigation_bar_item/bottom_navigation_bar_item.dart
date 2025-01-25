import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';

BottomNavigationBarItem bottomNavBarItem({
  required String title,
  // String? icon,
  required icon,
  required bool isSelected,
}) {
  return BottomNavigationBarItem(
      backgroundColor: AppColors.backgroundColor,
      tooltip: title,
      label: title,
      icon: Padding(
        padding: EdgeInsets.only(
          top: 4.h,
          bottom: 4.h,
        ),
        child: icon,
      ));
}
