import 'package:cospace/app_settings/views/bottom_nav_bar.dart';
import 'package:cospace/cospace/logic/cospace_cubit.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/snak.dart';
import 'package:cospace/user/logic/user_cubit.dart';
import 'package:cospace/user/logic/user_state.dart';
import 'package:cospace/user/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Welcome back!', style: TextStyle(color: AppColors.blackColor, fontSize: 40.0, fontWeight: FontWeight.bold)),
              subtitle: Text('Login to your account!', style: AppFonts.priamryGreyFont,),
            ),
            ListTile(
              title: Text('Email', style: AppFonts.primaryBlackFont),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.greyColor, width: 0.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.greyColor, width: 0.5)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.red, width: 0.5)
                    ),
                    labelText: 'Email Address',
                    labelStyle: AppFonts.subGreyFont,
                    prefixIcon: Icon(Icons.email, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            ListTile(
              title: Text('Password', style: AppFonts.primaryBlackFont),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.greyColor, width: 0.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.greyColor, width: 0.5)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.red, width: 0.5)
                    ),
                    labelText: 'Password',
                    labelStyle: AppFonts.subGreyFont,
                    prefixIcon: Icon(Icons.lock, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text('Forget password?', style: AppFonts.subGreyFont),
                ),
                onTap: () {},
              )
            ),
            BlocConsumer<UserCubit, UserState>(
              listener: (context, state) async {
                if (state is UserLoginErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar('Invalid Credientls', AppColors.redColor));
                } else if (state is UserLoginSomeThignWentWrongState) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar('Some Thing went wrong!', AppColors.redColor));
                } else if (state is UserLoginSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar('Login Success', AppColors.greenColor));
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setBool('isLoggedIn', true);
                  BlocProvider.of<CoSpaceCubit>(context).getBanners();
                  BlocProvider.of<CoSpaceCubit>(context).getSpaces();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavBar()));
                }
              },
              builder: (context, state) => TextButton(
                child: state is UserLoginLoadingState ? CircularProgressIndicator() : Text('Login', style: AppFonts.miniWhiteFont),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.greenColor,
                  fixedSize: Size(0.0, 50.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                ),
                onPressed: state is UserLoginLoadingState ? () {} : () async {
                  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar('Email & Password Required', Colors.red));
                  } else {
                    await BlocProvider.of<UserCubit>(context).loginUser(emailController.text, passwordController.text);
                  }
                },
              ),
            ),
            SizedBox(height: 50.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Don\'t have an account ?', style: AppFonts.subGreyFont),
                  InkWell(
                    child: Text('  Signup', style: AppFonts.subGreenFont),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}