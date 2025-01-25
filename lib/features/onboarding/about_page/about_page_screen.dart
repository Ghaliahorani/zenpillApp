import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenpill_app/core/app_state/app_state.dart';
import 'package:zenpill_app/core/constants/app_strings.dart';
import 'package:zenpill_app/core/generic_widgets/login_signup_widgets/custom_inkwell.dart';
import 'package:zenpill_app/core/generic_widgets/main_button.dart';
import 'package:zenpill_app/core/theme/app_colors.dart';
import 'package:zenpill_app/features/login_signup/verify/verify_screen.dart';
import 'package:zenpill_app/features/onboarding/about_page/cubit/about_page_cubit.dart';
import 'package:zenpill_app/features/onboarding/about_page/cubit/about_page_state.dart';
import 'package:zenpill_app/features/onboarding/about_page/generec_widgets/custom_gesturedetector.dart';

class AboutPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(AppStrings.tellUSAboutToutSelf),
                Text(AppStrings.weWillTailorYour),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.h,
              children: [
                Text(AppStrings.whatBestDescribesYou),
                BlocBuilder<AboutPageCubit, AboutPageState>(
                  builder: (context, state) {
                    return Wrap(
                      spacing: 8.w, // المسافة بين العناصر أفقياً
                      runSpacing: 8.h, // المسافة بين الأسطر عمودياً
                      children: List.generate(state.options.length, (index) {
                        return CustomGesturedetector(
                          label: state.options[index],
                          isSelected: state.selectedOption == index,
                          onTap: () {
                            context.read<AboutPageCubit>().selectOption(index);
                          },
                        );
                      }),
                    );
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(AppStrings.whereDoYouDreamOfBeing),
                BlocBuilder<AboutPageCubit, AboutPageState>(
                  builder: (context, state) {
                    return Wrap(
                      spacing: 8.w, // المسافة بين العناصر أفقياً
                      runSpacing: 8.h, // المسافة بين الأسطر عمودياً
                      children: List.generate(state.locations.length, (index) {
                        return CustomGesturedetector(
                          label: state.locations[index],
                          isSelected: state.selectedLocations.contains(index),
                          onTap: () {
                            context
                                .read<AboutPageCubit>()
                                .selectLocation(index);
                          },
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
            Column(
              spacing: 16.h,
              children: [
                BlocBuilder<AboutPageCubit, AboutPageState>(
                  builder: (context, state) {
                    // في حالة التحميل (تغيير الزر إلى دائرة تحميل)
                    if (state is AboutLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // في حالة أخرى (إظهار الزر العادي)
                    return MainButton(
                      fillColor: AppColors.primaryColor,
                      textButton: "Submit",
                      textStyleButton:
                          TextStyle(fontSize: 16.sp, color: Colors.white),
                      onPressed: (state is AboutOptionSelected &&
                              state.isButtonEnabled)
                          ? () async {
                              await context.read<AboutPageCubit>().submitForm();
                              AppState.isFirstOpen = false;
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VerifyScreen(),
                              ));
                            }
                          : null,
                      isEnabled: (state is AboutOptionSelected &&
                          state.isButtonEnabled),
                    );
                  },
                ),
                CustomInkwell(
                  text: AppStrings.skip,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
