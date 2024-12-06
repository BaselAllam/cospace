import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';



SnackBar snackBar(String content, Color color) {
  return SnackBar(
    content: Text(content, style: AppFonts.primaryWhiteFont),
    duration: Duration(seconds: 2),
    backgroundColor: color
  );
}