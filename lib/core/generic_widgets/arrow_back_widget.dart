import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';

import '../constants/app_images.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.funElementColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: SvgPicture.asset(AppImages.backArrowIcon),
      ),
    );
  }
}
