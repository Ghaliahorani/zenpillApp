import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';
import 'package:zenpill_app/core/theme/app_text_style.dart';

class HalfCapsule extends StatelessWidget {
  final bool isActive;
  final bool isLeft;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final TextEditingController numOfCodde;

  const HalfCapsule(
      {Key? key,
      required this.isActive,
      this.isLeft = true,
      required this.focusNode,
      required this.onChanged,
      required this.numOfCodde})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 56.h,
      // margin:
      //     isLeft ? EdgeInsets.only(left: 25.w) : EdgeInsets.only(right: 25.w),
      // const EdgeInsets.symmetric(horizontal: 8)
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isLeft ? 30.r : 0),
          bottomLeft: Radius.circular(isLeft ? 30.r : 0),
          topRight: Radius.circular(isLeft ? 0 : 30.r),
          bottomRight: Radius.circular(isLeft ? 0 : 30.r),
        ),
        border: isActive
            ? Border.all(color: AppColors.primaryColor, width: 1.3.r)
            : Border.all(width: 0),
      ),
      child: Center(
        child: TextFormField(
          controller: numOfCodde,
          focusNode: focusNode,
          maxLength: 1,
          textAlign: TextAlign.center,
          style: AppTextStyle.f24W500White,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: "", // إخفاء عداد الحروف
          ),
          keyboardType: TextInputType.number,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
