import 'package:flutter/material.dart';
import 'package:zenpill_app/core/constants/app_images.dart';
import 'package:zenpill_app/core/generic_widgets/arrow_back_widget.dart';
import 'package:zenpill_app/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:zenpill_app/core/generic_widgets/login_signup_widgets/custom_inkwell.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';
import 'package:zenpill_app/features/login_signup/generic_widgets/bottom_container.dart';
import 'package:zenpill_app/features/login_signup/generic_widgets/welcome_container.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/main_button.dart';
import '../../../core/theme/app_text_style.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String phone = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowBackWidget(),
              WelcomeContainer(
                textTitle: AppStrings.yourNextAdventureAwaits,
                textSubTitle: AppStrings.feelTheExtraordinary,
              ),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    CustomTextFormField(
                      onChanged: (value) {
                        phone = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.errorPhoneEmpty;
                        }
                        if (!RegExp(r'^9\d{8}$').hasMatch(value)) {
                          return AppStrings.phoneNumber;
                        }
                        return null;
                      },
                      controller: _phone,
                      prefix: AppImages.phoneNumberIcon,
                      hintText: AppStrings.phoneNumber,
                    ),
                    CustomTextFormField(
                      onChanged: (value) {
                        password = value;
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
                      controller: _password,
                      prefix: AppImages.lockIcon,
                      isPassword: true,
                      hintText: AppStrings.enterPassword,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomInkwell(text: AppStrings.forgotPassword, onTap: () {}),
                ],
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
              BottomContainer(
                text1PrimryColor: '',
                text1: '',
                text2: AppStrings.dontHaveAccount,
                text2Primry: AppStrings.signIn,
                orSignWith: AppStrings.orLogInWith,
              )
            ],
          ),
        ),
      ),
    );
  }
}
