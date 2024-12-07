import 'package:cospace/app_settings/logic/app_settings_cubit.dart';
import 'package:cospace/app_settings/logic/app_settings_state.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Wishlisst'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.replay),
                label: 'Bookings'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile'
              ),
            ],
            elevation: 0.0,
            backgroundColor: AppColors.backgroundColor,
            selectedIconTheme: IconThemeData(color: AppColors.greenColor, size: 20.0),
            selectedItemColor: AppColors.greenColor,
            selectedLabelStyle: AppFonts.subBlackFont,
            unselectedIconTheme: IconThemeData(color: AppColors.greyColor, size: 20.0),
            unselectedItemColor: AppColors.greyColor,
            unselectedLabelStyle: AppFonts.subGreyFont,
            currentIndex: BlocProvider.of<AppSettingsCubit>(context).selectedIndex,
            onTap: (index) {
              BlocProvider.of<AppSettingsCubit>(context).changeBottomNav(index);
            },
          ),
          body: BlocProvider.of<AppSettingsCubit>(context).screens[BlocProvider.of<AppSettingsCubit>(context).selectedIndex],
        );
        },
    );
  }
}