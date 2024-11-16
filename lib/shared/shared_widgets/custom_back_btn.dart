import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:flutter/material.dart';


class CustomBackBtn extends StatefulWidget {
  const CustomBackBtn({super.key});

  @override
  State<CustomBackBtn> createState() => _CustomBackBtnState();
}

class _CustomBackBtnState extends State<CustomBackBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.greyColor, width: 0.5)
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        color: AppColors.greyColor,
        iconSize: 25,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}