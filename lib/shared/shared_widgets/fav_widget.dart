import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:flutter/material.dart';


class FavWidget extends StatefulWidget {
  const FavWidget({super.key});

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white70
      ),
      child: IconButton(
        icon: Icon(isPressed ? Icons.favorite : Icons.favorite_border),
        color: AppColors.redColor,
        iconSize: 20,
        onPressed: () {
          isPressed = !isPressed;
          setState(() {});
        },
      )
    );
  }
}