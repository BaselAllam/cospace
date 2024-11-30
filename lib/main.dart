
/*

  - Packages
    - Shared Preferences
    - snackBar

  Fri & Sat
    - Intro to StateManagment
    - Difference Between Approaches
    - HTTPS & API
    - App Integration

*/


import 'package:cospace/app_settings/views/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}