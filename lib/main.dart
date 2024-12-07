
/*

  Fri & Sat
    - Intro to StateManagment
    - Difference Between Approaches
    - HTTPS & API
    - App Integration

*/

import 'package:cospace/app_settings/logic/app_settings_cubit.dart';
import 'package:cospace/app_settings/views/splash_screen.dart';
import 'package:cospace/cospace/logic/cospace_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

CoSpaceController coSpaceController = CoSpaceController();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppSettingsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}