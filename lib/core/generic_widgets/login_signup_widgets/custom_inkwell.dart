import 'package:flutter/material.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';
import 'package:zenpill_app/core/theme/app_text_style.dart';

class CustomInkwell extends StatelessWidget {
  CustomInkwell({
    required this.text,
    required this.onTap,
    this.isUnderLined = false,
  });

  final String text;
  final Function onTap;
  var isUnderLined;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Text(
        text,
        style: AppTextStyle.f16W400Primary.copyWith(
          decoration:
              isUnderLined ? TextDecoration.underline : TextDecoration.none,
          decorationColor: isUnderLined ? AppColors.primaryColor : null,
        ),
      ),
    );
  }
}
