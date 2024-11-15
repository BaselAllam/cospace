
/*

  Design => https://www.behance.net/gallery/183384685/Coworking-App-UI-Coworking-Space-App-UI-Figma-UI?tracking_source=search_projects%7Ccoworking+app


*/


import 'package:flutter/material.dart';
import 'package:cospace/app_settings/views/home_page.dart';

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
      home: HomePage(),
    );
  }
}