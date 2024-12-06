import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/fav_widget.dart';
import 'package:cospace/shared/shared_widgets/overall_rating_widget.dart';
import 'package:flutter/material.dart';


class VerticalCospaceWidget extends StatefulWidget {
  const VerticalCospaceWidget({super.key});

  @override
  State<VerticalCospaceWidget> createState() => _VerticalCospaceWidgetState();
}

class _VerticalCospaceWidgetState extends State<VerticalCospaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsF4Ii2dgdzrnorL6LaqjE5l2Osr0hFVVL2A&s'),
                    fit: BoxFit.fill
                  ),
                ),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OverallRatingWidget(),
                    // FavWidget()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                width: MediaQuery.of(context).size.width / 2.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Shared Space', style: AppFonts.miniGreenFont),
                    Text('Workhub Connect', softWrap: true, style: AppFonts.primaryBlackFont),
                    Text('80EGP/H', style: AppFonts.miniGreenFont),
                  ],
                ),
              ),
            ],
          ),
          Divider(endIndent: 10.0, indent: 10.0, thickness: 0.5, color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.directions_walk_rounded, color: AppColors.greenColor),
                  Text(' 5 ', style: AppFonts.subBlackFont),
                  Text('MIN', style: AppFonts.subGreyFont),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: AppColors.greenColor),
                  Text(' 2.3 ', style: AppFonts.subBlackFont),
                  Text('KM', style: AppFonts.subGreyFont),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.watch_later, color: AppColors.greenColor),
                  Text(' open', style: AppFonts.subBlackFont),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}