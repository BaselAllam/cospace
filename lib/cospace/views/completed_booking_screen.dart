import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_widgets/cospace_widget.dart';
import 'package:flutter/material.dart';


class CompletedBookingScreen extends StatefulWidget {
  const CompletedBookingScreen({super.key});

  @override
  State<CompletedBookingScreen> createState() => _CompletedBookingScreenState();
}

class _CompletedBookingScreenState extends State<CompletedBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            for (int i = 0; i < 10; i++)
            CospaceWidget(screenName: 'CompletedBooking',)
          ],
        ),
      ),
    );
  }
}