import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zenpill_app/core/app_state/app_state.dart';
import 'package:zenpill_app/core/constants/app_images.dart';
import 'package:zenpill_app/features/login_signup/pages/login_screen.dart';
import 'package:zenpill_app/features/login_signup/verify/verify_screen.dart';
import 'package:zenpill_app/features/onboarding/about_page/about_page_screen.dart';
import 'package:zenpill_app/features/onboarding/about_page/cubit/about_page_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializePrefs();
  }

  Future<void> _initializePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    AppState.prefs = prefs;
    _checkFirstOpen();
  }

  Future<void> _checkFirstOpen() async {
    final bool isFirstOpen = AppState.prefs.getBool('isFirstOpen') ?? true;

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isFirstOpen) {
          AppState.prefs.setBool('isFirstOpen', false);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => AboutPageScreen(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => AboutPageScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppImages.googleIcon),
      ),
    );
  }
}
