import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenpill_app/core/constants/app_images.dart';
import 'package:zenpill_app/core/constants/app_strings.dart';
import 'package:zenpill_app/core/generic_widgets/arrow_back_widget.dart';
import 'package:zenpill_app/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:zenpill_app/core/generic_widgets/login_signup_widgets/custom_inkwell.dart';
import 'package:zenpill_app/core/generic_widgets/main_button.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';
import 'package:zenpill_app/core/theme/app_text_style.dart';
import 'package:zenpill_app/features/login_signup/generic_widgets/bottom_container.dart';
import 'package:zenpill_app/features/login_signup/generic_widgets/welcome_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String phoneValue = '';
  String passwordValue = '';
  String confirmPasswordValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowBackWidget(),
              WelcomeContainer(
                textTitle: AppStrings.JOINEXPERIENCE,
                textSubTitle: AppStrings.CREATE_AN_ACCUNT,
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 28,
                  children: [
                    CustomTextFormField(
                      onChanged: (value) {
                        phoneValue = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.errorPhoneEmpty;
                        }
                        if (!RegExp(r'^9\d{8}$').hasMatch(value)) {
                          return AppStrings.errorPhoneEmpty;
                        }
                        return null;
                      },
                      hintText: AppStrings.phoneNumber,
                      controller: phone,
                      prefix: AppImages.phoneNumberIcon,
                    ),
                    CustomTextFormField(
                        onChanged: (value) {
                          passwordValue = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.errorPasswordEmpty;
                          }
                          if (!RegExp(
                                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{1,8}$')
                              .hasMatch(value)) {
                            return AppStrings.errorPassword;
                          }
                          return null;
                        },
                        hintText: AppStrings.newPassword,
                        isPassword: true,
                        controller: password,
                        prefix: AppImages.lockIcon),
                    CustomTextFormField(
                        hintText: AppStrings.confirmPassword,
                        isConfirmPassword: true,
                        controller: confirmPassword,
                        prefix: AppImages.lockIcon)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MainButton(
                  isEnabled: true,
                  textButton: AppStrings.signUpButton,
                  textStyleButton: AppTextStyle.f24W700White,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('الرقم صحيح!')),
                      );
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              BottomContainer(
                text1: AppStrings.bySignningUp,
                text1PrimryColor: AppStrings.termConditions,
                orSignWith: AppStrings.orSignUpWith,
                text2: AppStrings.alreadyHaveAnAccount,
                text2Primry: AppStrings.signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
