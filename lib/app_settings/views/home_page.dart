import 'package:cospace/cospace/logic/cospace_cubit.dart';
import 'package:cospace/cospace/logic/cospace_state.dart';
import 'package:cospace/cospace/views/categories_screen.dart';
import 'package:cospace/cospace/views/cospace_search_result.dart';
import 'package:cospace/main.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:cospace/shared/shared_widgets/cospace_widget.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocBuilder<CoSpaceCubit, CospaceState>(
        builder: (context, state) {
          if (state is GetBannersLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetBannersSomeThingWentWrongState || state is GetBannersErrorState) {
            return Center(child: Text('Sorry Some thing went wrong', style: AppFonts.primaryBlackFont));
          } else {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < BlocProvider.of<CoSpaceCubit>(context).banners.length; i++)
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(BlocProvider.of<CoSpaceCubit>(context).banners[i]),
                      fit: BoxFit.fill
                    )
                  ),
                ),
              ],
            );
          }
        },
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
    // return Container(
    //   height: 320,
    //   child: ListView(
    //     scrollDirection: Axis.horizontal,
    //     children: [
    //       for (int i = 0; i < coSpaceController.spaces.length; i++)
    //       CospaceWidget(coSpaceModel: coSpaceController.spaces[i],)
    //     ],
    //   ),
    // );
  }
}