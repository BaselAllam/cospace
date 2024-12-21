import 'dart:developer';
import 'package:cospace/cospace/logic/cospace_model.dart';
import 'package:cospace/cospace/logic/cospace_state.dart';
import 'package:cospace/shared/utils/app_assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CoSpaceCubit extends Cubit<CospaceState> {

  CoSpaceCubit() : super(CoSpaceInitState());

  Map _wishlistData = {};

  List<CoSpaceModel> _spaces = [];
  List<CoSpaceModel> get spaces => _spaces;

  List<CoSpaceModel> _favSpaces = [];
  List<CoSpaceModel> get favSpace => _favSpaces;

  void handleIsFav(CoSpaceModel cospaceModel) {
    if (!cospaceModel.isFav) {
      cospaceModel.isFav = true;
      _favSpaces.add(cospaceModel);
    } else {
      cospaceModel.isFav = false;
      for (int i = 0; i < _favSpaces.length; i++) {
        if (_favSpaces[i].id == cospaceModel.id) {
          _favSpaces.removeAt(i);
          break;
        }
      }
    }
    emit(HandleIsFavState());
  }

  List<String> _banners = [];
  List<String> get banners => _banners;

  Future<void> getBanners () async {
    emit(GetBannersLoadingState());
    try {
      http.Response response = await http.get(Uri.parse('${AppAssets.domain}/banners.json'));
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

  Future<void> getSpaces() async {
    emit(GetSpacesLoadingState());
    try {
      http.Response response = await http.get(Uri.parse('${AppAssets.domain}/cospaces.json'));
      if (response.statusCode == 200) {
        await getWishlsit();
        var data = json.decode(response.body);
        data.forEach((k, v) {
          bool isFav = false;
          log(_wishlistData.toString());
          _wishlistData.forEach((key, value) {
            if (k == value['spaceId']) {
              isFav = true;
            }
          });
          CoSpaceModel newCoSpaceModel = CoSpaceModel.fromJson(k, v, isFav);
          _spaces.add(newCoSpaceModel);
          if (isFav) _favSpaces.add(newCoSpaceModel);
        });
        emit(GetSpacesSuccessState());
      } else {
        emit(GetSpacesErrorState());
      }
    } catch (e) {
      emit(GetSpacesSomeThingWentWrongState());
    }
  }

  Future<void> getWishlsit() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String? uid = sharedPreferences.getString('userId');
      http.Response response = await http.get(Uri.parse('${AppAssets.domain}/wishlist.json/?orderBy="userId"&equalTo="$uid"'));
      var data = json.decode(response.body);
      _wishlistData = data;
    } catch (e) {

    }
  }
}