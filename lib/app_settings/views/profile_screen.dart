import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/notification_widget.dart';
import 'package:cospace/user/views/invite_firends_screen.dart';
import 'package:cospace/user/views/privacy_policy_sreen.dart';
import 'package:flutter/material.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List sections = [
    {
      'icon': Icons.person,
      'title': 'Profile Data',
      // 'screen': ProfileDataScreen()
    },
    {
      'icon': Icons.wallet,
      'title': 'Payment Method',
      // 'screen': ProfileDataScreen()
    },
    {
      'icon': Icons.settings,
      'title': 'Settings',
      // 'screen': ProfileDataScreen()
    },
    {
      'icon': Icons.info_outline,
      'title': 'Help Center',
      // 'screen': ProfileDataScreen()
    },
    {
      'icon': Icons.lock_open,
      'title': 'Privacy Policy',
      'screen': PrivacyPolicySreen()
    },
    {
      'icon': Icons.person_add,
      'title': 'Invite Friends',
      'screen': InviteFirendsScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [
          NotificationWidget()
        ],
        title: Text('Profile', style: AppFonts.primaryBlackFont),
        centerTitle: false,
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 170.0,
                  width: 170,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                      fit: BoxFit.contain
                    )
                  ),
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(Icons.add_a_photo),
                    color: AppColors.greenColor,
                    iconSize: 30.0,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Bassel Allam', style: AppFonts.primaryBlackFont,),
            ),
            for (var i in sections)
            Column(
              children: [
                ListTile(
                  leading: Icon(i['icon'], color: AppColors.greenColor, size: 30.0),
                  title: Text(i['title'], style: AppFonts.primaryNormalBlackFont),
                  trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greenColor, size: 20.0),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => i['screen']));
                  },
                ),
                Divider(endIndent: 20.0, indent: 20, thickness: 0.3, color: AppColors.greyColor)
              ],
            ),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.redColor, size: 30.0),
              title: Text('Logout', style: AppFonts.primaryRedFont),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}