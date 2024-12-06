import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/custom_back_btn.dart';
import 'package:cospace/shared/shared_widgets/custom_btn_widget.dart';
import 'package:flutter/material.dart';


class InviteFirendsScreen extends StatefulWidget {
  const InviteFirendsScreen({super.key});

  @override
  State<InviteFirendsScreen> createState() => _InviteFirendsScreenState();
}

class _InviteFirendsScreenState extends State<InviteFirendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: Text('Invite Friends', style: AppFonts.primaryBlackFont),
        leading: CustomBackBtn(),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < 10; i ++)
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  minRadius: 40,
                  maxRadius: 40,
                  backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                ),
                title: Text('Bassel Allam', style: AppFonts.primaryNormalBlackFont),
                subtitle: Text('201010119118', style: AppFonts.priamryGreyFont),
                trailing: CustomBtnWidget(title: 'Invite', backgroundColor: AppColors.greenColor, textStyle: AppFonts.miniWhiteFont, size: Size(50, 30),
                onPress: () {},
                ),
              ),
              Divider(endIndent: 20, indent: 20, thickness: 0.3, color: AppColors.greyColor)
            ],
          )
        ],
      ),
    );
  }
}