import 'package:cospace/cospace/logic/cospace_model.dart';
import 'package:cospace/cospace/logic/cospace_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoSpaceCubit extends Cubit<CospaceState> {

  CoSpaceCubit() : super(CoSpaceInitState());

  List<CoSpaceModel> _spaces = [
    CoSpaceModel(spaceName: 'Machinfy', rate: 4.7, isFav: false, price: 200, img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsF4Ii2dgdzrnorL6LaqjE5l2Osr0hFVVL2A&s'),
    CoSpaceModel(spaceName: 'CLS', rate: 4.8, isFav: true, price: 150, img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsF4Ii2dgdzrnorL6LaqjE5l2Osr0hFVVL2A&s'),
    CoSpaceModel(spaceName: 'ItShare', rate: 4.9, isFav: false, price: 300, img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsF4Ii2dgdzrnorL6LaqjE5l2Osr0hFVVL2A&s'),
  ];
  List<CoSpaceModel> get spaces => _spaces;

  List<CoSpaceModel> _favSpaces = [];
  List<CoSpaceModel> get favSpace => _favSpaces;

  void handleIsFav(CoSpaceModel cospaceModel, {int? favIndex}) {
    cospaceModel.isFav = !cospaceModel.isFav;
    if (cospaceModel.isFav) {
      _favSpaces.add(cospaceModel);
    } else {
      cospaceModel.isFav = false;
      _favSpaces.removeAt(favIndex!);
    }
  }

  List<String> _banners = [];
  List<String> get banners => _banners;

  Future<void> getBanners () async {
    emit(GetBannersLoadingState());
    try {
      http.Response response = await http.get(Uri.parse('https://cospace-795df-default-rtdb.firebaseio.com/banners.json'));
      if (response.statusCode == 200) {
        var resData = json.decode(response.body);
        resData.forEach((k, v) {
          _banners.add(v);
        });
        emit(GetBannersSuccessState());
      } else {
        emit(GetBannersErrorState());
      }
    } catch (e) {
      emit(GetBannersSomeThingWentWrongState());
    }
  }
}



/*

  EndPoint
    request
      Method
        post => add
        put => update
        patch => update ( specific field )
        delete => delete
        get => getData
      URL
        queryParameter
      Header
      body
    response
    logic


basselallam.com/products/id=?adsakjdhfkdfs

*/