import 'package:cospace/app_settings/views/home_page.dart';
import 'package:cospace/cospace/views/cospace_search_result.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/custom_back_btn.dart';
import 'package:flutter/material.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: Text('Categories', style: AppFonts.primaryBlackFont),
        leading: CustomBackBtn(),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            for (int i = 0; i < categories.length; i++)
            ListTile(
              leading: Icon(categories[i]['icon'], color: AppColors.greenColor, size: 30.0),
              title: Text(categories[i]['title'], style: AppFonts.primaryBlackFont),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.blackColor, size: 20.0),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SpaceSearchResult(title: categories[i]['title'],)));
              },
            )
          ],
        ),
      ),
    );
  }
}