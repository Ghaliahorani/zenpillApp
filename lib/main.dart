import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenpill_app/features/login_signup/pages/login_screen.dart';
import 'package:zenpill_app/features/login_signup/pages/sign_up_screen.dart';

import 'core/generic_widgets/custom_text_form_field/bloc/text_form_field_cubit.dart';

void main() {
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
              return TextFormFieldCubit();
            }),
          ],
          child: SafeArea(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SignUpScreen(),
            ),
          ),
        ));
  }
}
