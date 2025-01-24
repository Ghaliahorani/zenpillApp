import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/arrow_back_widget.dart';
import '../../../core/theme/app_text_style.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378.sp,
      height: 257.sp,
      // color: Colors.yellow,
      child: Column(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ArrowBackWidget(),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 145.sp,
                height: 140.sp,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.logoCups),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 80.sp,
              )
            ],
          ),
          Text(
            AppStrings.JOINEXPERIENCE,
            style: AppTextStyle.f24W700White,
            textAlign: TextAlign.center,
          ),
          Text(
            AppStrings.CREATE_AN_ACCUNT,
            style: AppTextStyle.f16W400Black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
