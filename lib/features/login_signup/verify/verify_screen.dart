import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenpill_app/core/constants/app_strings.dart';
import 'package:zenpill_app/core/generic_widgets/arrow_back_widget.dart';
import 'package:zenpill_app/core/generic_widgets/login_signup_widgets/custom_inkwell.dart';
import 'package:zenpill_app/core/generic_widgets/main_button.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';
import 'package:zenpill_app/core/theme/app_text_style.dart';
import 'package:zenpill_app/features/login_signup/generic_widgets/half_capsule.dart';
import 'package:zenpill_app/features/login_signup/pages/login_screen.dart';
import 'package:zenpill_app/features/login_signup/verify/cubit/button_cubit.dart';
import 'package:zenpill_app/features/login_signup/verify/cubit/capsule_state.dart';
import 'package:zenpill_app/features/login_signup/verify/cubit/capsule_cubit.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});

  int indexLastCapsule = 0;

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
            BlocBuilder<CapsuleCubit, CapsuleState>(
              builder: (context, state) {
                final cubit = context.read<CapsuleCubit>();
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        spacing: 4.w,
                        children: [
                          HalfCapsule(
                            isActive: state.activeIndex >= 0,
                            numOfCodde: cubit.controllers[0],
                            focusNode: cubit.focusNodes[0],
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                cubit.activateNext(0);
                              }
                              cubit.checkFieldsFilled();
                            },
                          ),
                          HalfCapsule(
                            isActive: state.activeIndex >= 1,
                            isLeft: false,
                            numOfCodde: cubit.controllers[1],
                            focusNode: cubit.focusNodes[1],
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                cubit.activateNext(1);
                              }
                              cubit.checkFieldsFilled();
                            },
                          ),
                        ],
                      ),
                      Row(
                        spacing: 4.w,
                        children: [
                          HalfCapsule(
                            isActive: state.activeIndex >= 2,
                            numOfCodde: cubit.controllers[2],
                            focusNode: cubit.focusNodes[2],
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                cubit.activateNext(2);
                              }
                              cubit.checkFieldsFilled();
                            },
                          ),
                          HalfCapsule(
                            isActive: state.activeIndex >= 3,
                            isLeft: false,
                            numOfCodde: cubit.controllers[3],
                            focusNode: cubit.focusNodes[3],
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                cubit.activateNext(3);
                              }
                              cubit.checkFieldsFilled();
                            },
                          ),
                        ],
                      ),
                    ]);
              },
            ),
            CustomInkwell(
              text: AppStrings.resendCode,
              onTap: () {},
            ),
            CustomInkwell(
              text: AppStrings.changePhoneNumber,
              onTap: () {},
              isUnderLined: true,
            ),
            BlocBuilder<CapsuleCubit, CapsuleState>(
              builder: (context, state) {
                return MainButton(
                  textStyleButton: AppTextStyle.f16W400Black,
                  fillColor: state.allFieldsFilled
                      ? AppColors.primaryColor
                      : AppColors.secondaryColor,
                  textButton: AppStrings.verify,
                  onPressed: state.allFieldsFilled
                      ? () {
                          // تنفيذ الإجراء (إظهار التحميل والانتقال)
                        }
                      : null,
                  isEnabled: state.allFieldsFilled,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
