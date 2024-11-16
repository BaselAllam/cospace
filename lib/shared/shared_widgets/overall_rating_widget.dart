import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';



class OverallRatingWidget extends StatefulWidget {
  const OverallRatingWidget({super.key});

  @override
  State<OverallRatingWidget> createState() => _OverallRatingWidgetState();
}

class _OverallRatingWidgetState extends State<OverallRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70
      ),
      child: Text(
        '⭐ 4.9',
        style: AppFonts.subBlackFont,
      ),
    );
  }
}