import 'package:cospace/main.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/cospace_widget.dart';
import 'package:cospace/shared/shared_widgets/notification_widget.dart';
import 'package:flutter/material.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: Text('Wishlist', style: AppFonts.primaryBlackFont),
        centerTitle: false,
        actions: [NotificationWidget()],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        // child: ListView(
        //   children: [
        //     for (int i = 0; i < coSpaceController.favSpace.length; i++)
        //     CospaceWidget(coSpaceModel: coSpaceController.favSpace[i], index: i,)
        //   ],
        // ),
      ),
    );
  }
}