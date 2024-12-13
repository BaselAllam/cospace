import 'package:cospace/cospace/logic/cospace_model.dart';
import 'package:cospace/main.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:flutter/material.dart';


class FavWidget extends StatefulWidget {
  CoSpaceModel coSpaceModel;
  final int index;
  FavWidget({required this.coSpaceModel, this.index = 0});

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white70
      ),
      child: IconButton(
        icon: Icon(widget.coSpaceModel.isFav ? Icons.favorite : Icons.favorite_border),
        color: AppColors.redColor,
        iconSize: 20,
        onPressed: () {
          // coSpaceController.handleIsFav(widget.coSpaceModel, favIndex: widget.index);
        },
      )
    );
  }
}