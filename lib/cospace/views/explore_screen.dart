import 'dart:developer';

import 'package:cospace/app_settings/logic/app_settings_cubit.dart';
import 'package:cospace/app_settings/logic/app_settings_state.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/notification_widget.dart';
import 'package:cospace/shared/shared_widgets/snak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  void initState() {
    BlocProvider.of<AppSettingsCubit>(context).getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [
          NotificationWidget()
        ],
        title: Text('Explore', style: AppFonts.primaryBlackFont),
        centerTitle: false,
      ),
      body: Container(
        child: BlocListener<AppSettingsCubit, AppSettingsState>(
          listener: (context, state) {
            if (state is MapRequestPermissionState) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar('Kindly Accpet Permission', AppColors.redColor));
            }
          },
          child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
            builder: (context, state) {
              if (state is MapLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  zoom: 20,
                  target: BlocProvider.of<AppSettingsCubit>(context).mapLatLng
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              );
            },
          ),
        ),
      ),
    );
  }
}