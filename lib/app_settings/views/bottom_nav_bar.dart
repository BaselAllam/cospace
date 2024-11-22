import 'package:cospace/app_settings/views/home_page.dart';
import 'package:cospace/app_settings/views/profile_screen.dart';
import 'package:cospace/app_settings/views/wishlist_screen.dart';
import 'package:cospace/cospace/views/bokkings_screen.dart';
import 'package:cospace/cospace/views/explore_screen.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List<Widget> screens = [
    HomePage(), ExploreScreen(), WishlistScreen(), BokkingsScreen(), ProfileScreen()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
      body: screens[selectedIndex],
    );
  }
}