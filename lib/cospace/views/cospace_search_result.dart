import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/cospace_widget.dart';
import 'package:cospace/shared/shared_widgets/custom_back_btn.dart';
import 'package:flutter/material.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';


class SpaceSearchResult extends StatefulWidget {
  final String title;
  const SpaceSearchResult({required this.title});

  @override
  State<SpaceSearchResult> createState() => _SpaceSearchResultState();
}

class _SpaceSearchResultState extends State<SpaceSearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: Text(widget.title, style: AppFonts.primaryBlackFont),
        leading: CustomBackBtn(),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            for (int i = 0; i < 10; i++)
            CospaceWidget()
          ],
        ),
      ),
    );
  }
}