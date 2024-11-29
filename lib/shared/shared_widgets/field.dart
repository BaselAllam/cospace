import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


field({
  required String title, required String hintTxt, required IconData prefixIcon,
  required TextEditingController controller, Widget suffixIcon = const SizedBox(), List<TextInputFormatter> inputFormatters = const [],
  bool isEnabled = true,
}) {
  return ListTile(
    title: Text(title, style: AppFonts.subBlackFont),
    subtitle: Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.whiteColor
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintTxt,
          hintStyle: AppFonts.priamryGreyFont,
          prefixIcon: Icon(prefixIcon, color: AppColors.greyColor, size: 20.0),
          suffixIcon: suffixIcon
        ),
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        inputFormatters: inputFormatters,
        enabled: isEnabled,
      ),
    ),
  );
}