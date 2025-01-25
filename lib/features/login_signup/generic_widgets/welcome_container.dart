import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/arrow_back_widget.dart';
import '../../../core/theme/app_text_style.dart';

class WelcomeContainer extends StatelessWidget {
  WelcomeContainer({super.key, this.textTitle, this.textSubTitle});

  final String? textTitle;
  final String? textSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378.sp,
      height: 270.sp,
      // color: Colors.yellow,
      child: Column(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 145.sp,
                height: 140.sp,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.logoCups),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          Text(
            textTitle!,
            style: AppTextStyle.f24W700White,
            textAlign: TextAlign.center,
          ),
          Text(
            textSubTitle!,
            style: AppTextStyle.f16W400Black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
