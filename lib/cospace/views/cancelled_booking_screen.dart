import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_widgets/cospace_widget.dart';
import 'package:flutter/material.dart';


class CancelledBookingScreen extends StatefulWidget {
  const CancelledBookingScreen({super.key});

  @override
  State<CancelledBookingScreen> createState() => _CancelledBookingScreenState();
}

class _CancelledBookingScreenState extends State<CancelledBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            // for (int i = 0; i < 10; i++)
            // CospaceWidget(screenName: 'CancelledBooking',)
          ],
        ),
      ),
    );
  }
}