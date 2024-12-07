import 'package:cospace/app_settings/logic/app_settings_state.dart';
import 'package:cospace/app_settings/views/home_page.dart';
import 'package:cospace/app_settings/views/profile_screen.dart';
import 'package:cospace/app_settings/views/wishlist_screen.dart';
import 'package:cospace/cospace/views/bokkings_screen.dart';
import 'package:cospace/cospace/views/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class AppSettingsCubit extends Cubit<AppSettingsState> {

  AppSettingsCubit() : super(AppSettingsNavState());

  List<Widget> _screens = [
    HomePage(), ExploreScreen(), WishlistScreen(), BokkingsScreen(), ProfileScreen()
  ];
  List<Widget> get screens => _screens;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void changeBottomNav(int index) {
    _selectedIndex = index;
    emit(AppSettingsNavState());
  }

  LatLng _mapLatLng = LatLng(30.0444, 31.2357);
  LatLng get mapLatLng => _mapLatLng;

  Future<void> getUserLocation() async {
    emit(MapLoadingState());
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever || locationPermission == LocationPermission.denied) {
      emit(MapRequestPermissionState());
      await Geolocator.requestPermission();
      return getUserLocation();
    }
    Position userPosition = await Geolocator.getCurrentPosition();
    _mapLatLng = LatLng(userPosition.latitude, userPosition.longitude);
    emit(MapSuccessState());
  }
}