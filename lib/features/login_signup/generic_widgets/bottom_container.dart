import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/login_signup_widgets/custom_inkwell.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer(
      {super.key,
      this.text1,
      this.text1PrimryColor,
      this.orSignWith,
      this.text2,
      this.text2Primry});

  final String? text1;
  final String? text1PrimryColor;
  final String? orSignWith;
  final String? text2;
  final String? text2Primry;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      child: Column(
        spacing: 13,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1!,
                style: AppTextStyle.f16W400Black,
              ),
              CustomInkwell(text: text1PrimryColor!, onTap: () {}),
            ],
          ),
          Text(
            orSignWith!,
            style: AppTextStyle.f16W400Black,
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.cardBackground,
                child: SvgPicture.asset(AppImages.googleIcon),
              ),
              CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.cardBackground,
                child: SvgPicture.asset(AppImages.facebookIcon),
              ),
              CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.cardBackground,
                child: SvgPicture.asset(AppImages.appleIcon),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text2!,
                style: AppTextStyle.f16W400Black,
              ),
              CustomInkwell(text: text2Primry!, onTap: () {}),
            ],
          )
        ],
      ),
    );
  }
}
