import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zenpill_app/features/home/pages/home_screen.dart';
import 'package:zenpill_app/features/home/pages/one.dart';
import 'package:zenpill_app/features/home/pages/three.dart';
import 'package:zenpill_app/features/home/pages/tow.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import 'bottom_navigation_bar_item.dart';
import '../cubit/bottom_navigation_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BottomNavigationCubit>().changePageIndex(newPageIndex: 0);
  }

  List<Widget> pages = [
    HomeScreen(),
    One(),
    Tow(),
    Three(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (BuildContext context, BottomNavigationState state) {
        return Scaffold(
          body: pages[state.pageIndex],
          bottomNavigationBar: SizedBox(
            height: 120.h,
            child: BottomNavigationBar(
              currentIndex: state.pageIndex,
              onTap: (index) {
                context
                    .read<BottomNavigationCubit>()
                    .changePageIndex(newPageIndex: index);
              },
              elevation: 10.0,
              type: BottomNavigationBarType.fixed,
              items: [
                bottomNavBarItem(
                  title: '',
                  isSelected: state.pageIndex == 0,
                  icon: Icon(Icons.password),
                ),
                bottomNavBarItem(
                  title: '',
                  isSelected: state.pageIndex == 1,
                  icon: Icon(Icons.password),
                ),
                bottomNavBarItem(
                  title: '',
                  isSelected: state.pageIndex == 2,
                  icon: Icon(Icons.password),
                ),
                bottomNavBarItem(
                  title: '',
                  isSelected: state.pageIndex == 3,
                  icon: Icon(Icons.password),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
