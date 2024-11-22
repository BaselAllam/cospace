import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:cospace/shared/shared_theme/app_fonts.dart';
import 'package:cospace/shared/shared_widgets/fav_widget.dart';
import 'package:cospace/shared/shared_widgets/overall_rating_widget.dart';
import 'package:flutter/material.dart';

// enum SpaceWidgetScreensName {OngoingBooking, CancelledBooking, CompletedBooking}

class CospaceWidget extends StatefulWidget {

  final String screenName;

  const CospaceWidget({this.screenName = 'Initial'});

  @override
  State<CospaceWidget> createState() => _CospaceWidgetState();
}

class _CospaceWidgetState extends State<CospaceWidget> {
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
          Container(
            height: 150,
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
                FavWidget()
              ],
            ),
          ),
          ListTile(
            title: Text('Shared Space', style: AppFonts.miniGreenFont),
            subtitle: Text('Workhub Connect', style: AppFonts.primaryBlackFont),
            trailing: Text('80EGP/H', style: AppFonts.miniGreenFont),
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
          ),
          if (widget.screenName == 'CancelledBooking')
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              child: Text('Re-book', style: AppFonts.miniWhiteFont),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.greenColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                fixedSize: Size(200.0, 30.0)
              ),
              onPressed: () {}, 
            ),
          ),
          if (widget.screenName == 'CompletedBooking')
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('Re-Book', style: AppFonts.miniWhiteFont),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size(100.0, 30.0)
                  ),
                  onPressed: () {}, 
                ),
                TextButton(
                  child: Text('E-Ticket', style: AppFonts.miniWhiteFont),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size(100.0, 30.0)
                  ),
                  onPressed: () {}, 
                ),
              ],
            ),
          ),
          if (widget.screenName == 'OngoingBooking')
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('Timer', style: AppFonts.miniWhiteFont),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size(100.0, 30.0)
                  ),
                  onPressed: () {}, 
                ),
                TextButton(
                  child: Text('E-Ticket', style: AppFonts.miniWhiteFont),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size(100.0, 30.0)
                  ),
                  onPressed: () {}, 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}