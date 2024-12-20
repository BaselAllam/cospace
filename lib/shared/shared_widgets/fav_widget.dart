import 'package:cospace/cospace/logic/cospace_cubit.dart';
import 'package:cospace/cospace/logic/cospace_model.dart';
import 'package:cospace/cospace/logic/cospace_state.dart';
import 'package:cospace/shared/shared_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FavWidget extends StatefulWidget {
  CoSpaceModel coSpaceModel;
  FavWidget({required this.coSpaceModel});

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoSpaceCubit, CospaceState>(
      builder: (context, state) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white70
        ),
        child: IconButton(
          icon: Icon(widget.coSpaceModel.isFav ? Icons.favorite : Icons.favorite_border),
          color: AppColors.redColor,
          iconSize: 20,
          onPressed: () {
            BlocProvider.of<CoSpaceCubit>(context).handleIsFav(widget.coSpaceModel);
          },
        )
      ),
    );
  }
}