
/*

  Design => https://www.behance.net/gallery/183384685/Coworking-App-UI-Coworking-Space-App-UI-Figma-UI?tracking_source=search_projects%7Ccoworking+app


  Next Session ( Fir, Sat )
    - profileData Screen
    - Settings Screen
    - Invite Friends Screen
    - Paymnet Method Screen 
    - Help Center Screen
    - Space Details Screen
    - Write Review Screen
    - Book Now ( Screens )
    - ERecept
    - Cancel Booking
    - Complete Screens

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