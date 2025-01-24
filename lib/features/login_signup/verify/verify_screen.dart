import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenpill_app/core/constants/app_strings.dart';
import 'package:zenpill_app/core/generic_widgets/arrow_back_widget.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';
import 'package:zenpill_app/core/theme/app_text_style.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          right: 16.w,
          left: 16.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                ArrowBackWidget(),
              ],
            ),
            Text(
              AppStrings.verify,
              style: AppTextStyle.f24W500White,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.verifyYourPhoneNumber,
                  style: AppTextStyle.f24W500White,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.weHaveSentCodeTo,
                          style: AppTextStyle.f16W400Black,
                        ),
                        Text(
                          "+963 944******,",
                          style: AppTextStyle.f16W400Black.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      AppStrings.pleaseEnterItBelow,
                      style: AppTextStyle.f16W400Black,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
