import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  DateTime? birthDate;
  bool isTermsAccepted = false;
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: AppColors.blackColor,
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Welcome!', style: TextStyle(color: AppColors.blackColor, fontSize: 40.0, fontWeight: FontWeight.bold)),
              subtitle: Text('Let\'s Start!', style: AppFonts.priamryGreyFont,),
            ),
            ListTile(
              title: Text('User Name', style: AppFonts.primaryBlackFont),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: userNameController,
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
                    labelText: 'User Name',
                    labelStyle: AppFonts.subGreenFont,
                    prefixIcon: Icon(Icons.person, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),
              ),
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
                    labelStyle: AppFonts.subGreenFont,
                    prefixIcon: Icon(Icons.email, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            ListTile(
              title: Text('Phone Number', style: AppFonts.primaryBlackFont),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: phoneNumberController,
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
                    labelText: 'Phone Number',
                    labelStyle: AppFonts.subGreenFont,
                    prefixIcon: Icon(Icons.phone, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            ListTile(
              title: Text('Birthdate', style: AppFonts.primaryBlackFont),
              subtitle: Text(birthDate == null ? 'Select Date' : birthDate.toString().substring(0, 11), style: AppFonts.subGreenFont),
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 100),
                  lastDate: DateTime(DateTime.now().year - 15),
                  initialDate: DateTime(DateTime.now().year - 15)
                );
                if (selectedDate != null) {
                  birthDate = selectedDate;
                  setState(() {});
                }
              },
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
                    labelStyle: AppFonts.subGreenFont,
                    prefixIcon: Icon(Icons.lock, color: AppColors.blackColor, size: 20.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      color: AppColors.greyColor,
                      iconSize: 20.0,
                      onPressed: () {
                        isSecure = !isSecure;
                        setState(() {});
                      },
                    )
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: isSecure
                ),
              ),
            ),
            ListTile(
              title: Text('Confirm Password', style: AppFonts.primaryBlackFont),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: confirmPasswordController,
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
                    labelText: 'Confirm Password',
                    labelStyle: AppFonts.subGreenFont,
                    prefixIcon: Icon(Icons.lock, color: AppColors.blackColor, size: 20.0),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                ),
              ),
            ),
            SwitchListTile(
              title: Text('Accept Our Terms & Conditions', style: AppFonts.subBlackFont),
              subtitle: InkWell(onTap: () {}, child: Text('Read our Terms & Conditions', style: AppFonts.subGreenFont)),
              value: isTermsAccepted,
              activeColor: AppColors.whiteColor,
              activeTrackColor: AppColors.greenColor,
              hoverColor: AppColors.greenColor,
              onChanged: (value) {
                isTermsAccepted = value;
                setState(() {});
              },
            ),
            SizedBox(height: 30.0),
            TextButton(
              child: Text('Register', style: AppFonts.miniWhiteFont),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.greenColor,
                fixedSize: Size(0.0, 50.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),
              onPressed: () {
                // if (emailController.text.isEmpty || userNameController.text.isEmpty || phoneNumberController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar('Some Data Required', Colors.red));
                // } else if (passwordController.text != confirmPasswordController.text) {
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar('Password & Confirm Password not Matched', Colors.red));
                // } else if (passwordController.text.length < 8) {
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar('Password Must be at least 8 Characters', Colors.red));
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar('Registerd Successfully, Let\'s Login', Colors.green));
                // }
              },
            ),
          ],
        ),
      ),
    );
  }
}