import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/custom_back_btn.dart';
import 'package:cospace/shared/utils/cancelation_policy.dart';
import 'package:flutter/material.dart';



class PrivacyPolicySreen extends StatefulWidget {
  const PrivacyPolicySreen({super.key});

  @override
  State<PrivacyPolicySreen> createState() => _PrivacyPolicySreenState();
}

class _PrivacyPolicySreenState extends State<PrivacyPolicySreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: Text('Privacy Policy', style: AppFonts.primaryBlackFont),
        leading: CustomBackBtn(),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text('Cancelation Policy', style: AppFonts.subGreenFont),
              subtitle: Text(cancelationPolicy, style: AppFonts.subGreyFont),
            ),
            ListTile(
              title: Text('Terms & Conditions', style: AppFonts.subGreenFont),
              subtitle: Text(termsAndConditions, style: AppFonts.subGreyFont),
            ),
          ],
        ),
      ),
    );
  }
}