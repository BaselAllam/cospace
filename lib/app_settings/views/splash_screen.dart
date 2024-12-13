import 'package:cospace/app_settings/views/bottom_nav_bar.dart';
import 'package:cospace/cospace/logic/cospace_cubit.dart';
import 'package:cospace/user/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: verifyInitData(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {}
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  verifyInitData() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLoggedIn = sharedPreferences.getBool('isLoggedIn');
    if (isLoggedIn == null || !isLoggedIn) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
      return;
    }
    BlocProvider.of<CoSpaceCubit>(context).getBanners();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavBar()));
    return;
  }
}