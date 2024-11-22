import 'package:cospace/app_settings/views/notification_screen.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:flutter/material.dart';


class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.notifications),
      iconSize: 30.0,
      color: AppColors.greenColor,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationScreen()));
      },
    );
  }
}