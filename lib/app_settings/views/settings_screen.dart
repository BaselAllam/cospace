import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/custom_back_btn.dart';
import 'package:cospace/shared/shared_widgets/custom_btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isAccept = true;
  String selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: Text('Settings', style: AppFonts.primaryBlackFont),
        leading: CustomBackBtn(),
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              title: Text('Accept Notifications', style: AppFonts.primaryBlackFont),
              trailing: Switch(
                value: isAccept,
                activeColor: AppColors.greenColor,
                focusColor: AppColors.greyColor,
                hoverColor: AppColors.greenColor,
                onChanged: (v) {
                  isAccept = v;
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: Text('Change Language', style: AppFonts.primaryBlackFont),
              trailing: DropdownMenu(
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'Arabic', label: 'Arabic'),
                  DropdownMenuEntry(value: 'English', label: 'English'),
                ],
                initialSelection: selectedLang,
                onSelected: (v) {
                  selectedLang = v!;
                  setState(() {});
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.redColor, size: 30.0),
              title: Text('Delete Account', style: AppFonts.primaryRedFont),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('Attention', style: AppFonts.primaryRedFont,),
                      content: Text('Are you sure you want to Delete Account ?', style: AppFonts.primaryNormalBlackFont,),
                      actions: [
                        CustomBtnWidget(
                          title: 'Yes', backgroundColor: Colors.transparent, size: Size(100, 30), textStyle: AppFonts.primaryRedFont,
                          onPress: () {},
                        ),
                        CustomBtnWidget(title: 'No', backgroundColor: Colors.transparent, size: Size(100, 30), textStyle: AppFonts.priamryGreyFont,
                        onPress: () {},
                        ),
                      ],
                    );
                  }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}