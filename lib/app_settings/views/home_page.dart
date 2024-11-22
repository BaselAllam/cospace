import 'package:cospace/cospace/views/categories_screen.dart';
import 'package:cospace/cospace/views/cospace_search_result.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:cospace/shared/shared_widgets/cospace_widget.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';

List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.people,
      'title': 'Shared Spaces'
    },
    {
      'icon': Icons.meeting_room,
      'title': 'Conference'
    },
    {
      'icon': Icons.area_chart,
      'title': 'Open Space'
    },
    {
      'icon': Icons.bookmark_add,
      'title': 'Dedicated'
    },
  ];


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> images = [
    'https://images.pexels.com/photos/29101851/pexels-photo-29101851/free-photo-of-scenic-autumn-road-through-a-forest.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load',
    'https://images.pexels.com/photos/17798437/pexels-photo-17798437/free-photo-of-house-between-forest-and-lake.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load',
    'https://images.pexels.com/photos/28865271/pexels-photo-28865271/free-photo-of-cozy-armchair-in-lush-indoor-greenhouse-setting.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load',
    'https://images.pexels.com/photos/27019303/pexels-photo-27019303.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load',
    'https://images.pexels.com/photos/29187003/pexels-photo-29187003/free-photo-of-couple-strolling-through-a-vibrant-autumn-forest.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load'
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
        title: Text('CoSpace', style: AppFonts.primaryBlackFont),
        centerTitle: false,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            sectonTitle('#Offers for you', SizedBox()),
            buildOffersSection(),
            sectonTitle('Category', CategoriesScreen()),
            buildCategoriesSection(),
            sectonTitle('Popular Spaces', SpaceSearchResult(title: 'Popular Spaces')),
            buildPopularSection(),
          ],
        )
      ),
    );
  }

  sectonTitle(String title, Widget screen) {
    return ListTile(
      title: Text(title, style: AppFonts.primaryBlackFont),
      trailing: title == '#Offers for you' ? SizedBox() : Text('See all', style: AppFonts.miniGreenFont),
      onTap: title == '#Offers for you' ? () {} : () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
    );
  }

  buildOffersSection() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < images.length; i++)
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(images[i]),
                fit: BoxFit.fill
              )
            ),
          ),
        ],
      ),
    );
  }

  buildCategoriesSection() {
    return Container(
      height: 135,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < categories.length; i ++)
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SpaceSearchResult(title: categories[i]['title'])));
            },
            child: Container(
              width: 90,
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Icon(categories[i]['icon'], color: Colors.green, size: 50.0),
                  ),
                  Text(categories[i]['title'], textAlign: TextAlign.center, style: AppFonts.subBlackFont),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildPopularSection() {
    return Container(
      height: 320,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < 5; i++)
          CospaceWidget()
        ],
      ),
    );
  }
}