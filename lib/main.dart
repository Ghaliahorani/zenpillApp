import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenpill_app/core/app_state/app_state.dart';
import 'package:zenpill_app/features/home/bottom_navigation_bar_item/main_screen.dart';
import 'package:zenpill_app/features/home/cubit/bottom_navigation_cubit.dart';
import 'package:zenpill_app/features/login_signup/pages/login_screen.dart';
import 'package:zenpill_app/features/login_signup/pages/sign_up_screen.dart';
import 'package:zenpill_app/features/login_signup/verify/verify_screen.dart';
import 'package:zenpill_app/features/onboarding/about_page/about_page_screen.dart';
import 'package:zenpill_app/features/onboarding/about_page/cubit/about_page_cubit.dart';
import 'package:zenpill_app/features/splash/splash_screen.dart';

import 'core/generic_widgets/custom_text_form_field/bloc/text_form_field_cubit.dart';
import 'features/login_signup/verify/cubit/verify_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppState.initializePrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) {
              return VerifyCubit();
            }),
            BlocProvider(create: (BuildContext context) {
              return TextFormFieldCubit();
            }),
            BlocProvider(create: (BuildContext context) {
              return AboutPageCubit();
            }),
            BlocProvider(create: (BuildContext context) {
              return BottomNavigationCubit();
            }),
          ],
          child: SafeArea(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MainScreen(),
            ),
          ),
        ));
  }
}
