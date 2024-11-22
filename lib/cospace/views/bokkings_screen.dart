import 'package:cospace/cospace/views/cancelled_booking_screen.dart';
import 'package:cospace/cospace/views/completed_booking_screen.dart';
import 'package:cospace/cospace/views/ongoing_bookig_screen.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/notification_widget.dart';
import 'package:flutter/material.dart';


class BokkingsScreen extends StatefulWidget {
  const BokkingsScreen({super.key});

  @override
  State<BokkingsScreen> createState() => _BokkingsScreenState();
}

class _BokkingsScreenState extends State<BokkingsScreen> with TickerProviderStateMixin {

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: Text('My Bookings', style: AppFonts.primaryBlackFont),
        centerTitle: false,
        actions: [NotificationWidget()],
        bottom: PreferredSize(
          preferredSize: Size(0.0, 30),
          child: TabBar(
            indicatorColor: AppColors.greenColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 5,
            unselectedLabelStyle: AppFonts.priamryGreyFont,
            labelStyle: AppFonts.subGreenFont,
            controller: tabController,
            tabs: [
              Text('Ongoing'),
              Text('Completed'),
              Text('Cancelled'),
            ],
          )
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          OngoingBookigScreen(),
          CompletedBookingScreen(),
          CancelledBookingScreen()
        ],
      )
    );
  }
}