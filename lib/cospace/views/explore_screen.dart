import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  LatLng mapLatLng = LatLng(30.0444, 31.2357);

  @override
  void initState() {
    getUserLocation();
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
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            zoom: 12,
            target: mapLatLng
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
      ),
    );
  }

  getUserLocation() async {
    Position userPosition = await Geolocator.getCurrentPosition();
    mapLatLng = LatLng(userPosition.latitude, userPosition.longitude);
    setState(() {});
  }
}