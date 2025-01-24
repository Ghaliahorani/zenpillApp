import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenpill_app/core/constants/app_images.dart';
import 'package:zenpill_app/core/constants/app_strings.dart';
import 'package:zenpill_app/core/generic_widgets/arrow_back_widget.dart';
import 'package:zenpill_app/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';
import 'package:zenpill_app/core/theme/app_text_style.dart';
import 'package:zenpill_app/features/login_signup/generic_widgets/welcome_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController comfirtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            WelcomeContainer(),
            Column(
              spacing: 10,
              children: [CustomTextFormField(controller: phone)],
            )
          ],
        ),
      ),
    );
  }
}
